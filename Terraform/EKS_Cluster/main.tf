# Data block to reference the existing VPC
data "aws_vpc" "existing_vpc" {
  id = var.vpc_id
}

# Data block to get existing subnets
data "aws_subnet_ids" "private_subnets" {
  vpc_id = data.aws_vpc.existing_vpc.id
  filters = [
    {
      name   = "tag:kubernetes.io/role/internal-elb"
      values = ["1"]
    }
  ]
}

data "aws_subnet_ids" "public_subnets" {
  vpc_id = data.aws_vpc.existing_vpc.id
  filters = [
    {
      name   = "tag:kubernetes.io/role/elb"
      values = ["1"]
    }
  ]
}

# Create IAM roles and policies for EKS
module "eks_iam" {
  source  = "terraform-aws-modules/iam/aws//modules/eks"
  version = "5.0.0"

  cluster_name = var.cluster_name
}

# Create the EKS Cluster in the existing VPC
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "19.0.0"
  cluster_name    = var.cluster_name
  cluster_version = "1.26"
  subnets         = data.aws_subnet_ids.private_subnets.ids
  vpc_id          = data.aws_vpc.existing_vpc.id

  cluster_iam_role_name = module.eks_iam.cluster_role_name

  node_groups = {
    eks_nodes = {
      desired_capacity = var.desired_capacity
      max_capacity     = var.max_size
      min_capacity     = var.min_size

      instance_type = var.node_instance_type
    }
  }
}

# Create an Application Load Balancer (ALB)
resource "aws_lb" "alb" {
  name               = "eks-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [module.vpc.default_security_group_id]
  subnets            = data.aws_subnet_ids.public_subnets.ids
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.default.arn
  }
}

resource "aws_lb_target_group" "default" {
  name     = "eks-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.existing_vpc.id
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "alb_dns_name" {
  value = aws_lb.alb.dns_name
}

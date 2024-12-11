variable "region" {
  default = "us-east-1"
}

variable "cluster_name" {
  default = "eks-cluster"
}

variable "node_instance_type" {
  default = "t3.medium"
}

variable "desired_capacity" {
  default = 2
}

variable "max_size" {
  default = 3
}

variable "min_size" {
  default = 1
}

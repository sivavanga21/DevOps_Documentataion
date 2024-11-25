variable "policy_name" {
  description = "The name of the AWS Organizations policy"
  type        = string
}
# 1. restricted-ssh (Restrict SSH Access)
resource "aws_config_config_rule" "restricted_ssh" {
  name        = var.policy_name
  description = "Ensure SSH access is restricted."
  source {
    owner             = "AWS"
    source_identifier = "INCOMING_SSH_DISABLED"
  }
}

# # 2. restricted-rdp (Restrict RDP Access)
# resource "aws_config_config_rule" "restricted_rdp" {
#   name        = "restricted-rdp"
#   description = "Ensure RDP access is restricted."
#   source {
#     owner             = "AWS"
#     source_identifier = "INCOMING_RDP_DISABLED"
#   }
# }

# # 3. ec2-volume-encryption (Ensure EC2 Volumes are Encrypted)
# resource "aws_config_config_rule" "ec2_volume_encryption" {
#   name        = "ec2-volume-encryption"
#   description = "Ensure EC2 volumes are encrypted."
#   source {
#     owner             = "AWS"
#     source_identifier = "ENCRYPTED_VOLUMES"
#   }
# }

# # 4. s3-bucket-encryption (Ensure S3 Buckets are Encrypted)
# resource "aws_config_config_rule" "s3_bucket_encryption" {
#   name        = "s3-bucket-encryption"
#   description = "Ensure S3 buckets are encrypted."
#   source {
#     owner             = "AWS"
#     source_identifier = "S3_BUCKET_SERVER_SIDE_ENCRYPTION_ENABLED"
#   }
# }

# # 5. multi-az-rds (Ensure RDS Instances are Multi-AZ)
# resource "aws_config_config_rule" "multi_az_rds" {
#   name        = "multi-az-rds"
#   description = "Ensure RDS instances are Multi-AZ."
#   source {
#     owner             = "AWS"
#     source_identifier = "RDS_MULTI_AZ"
#   }
# }

# # 6. iam-user-mfa-enabled (Ensure IAM Users Have MFA Enabled)
# resource "aws_config_config_rule" "iam_user_mfa_enabled" {
#   name        = "iam-user-mfa-enabled"
#   description = "Ensure IAM users have MFA enabled."
#   source {
#     owner             = "AWS"
#     source_identifier = "MFA_ENABLED_FOR_IAM_CONSOLE_ACCESS"
#   }
# }

# # 7. rds-snapshot-encryption (Ensure RDS Snapshots are Encrypted)
# resource "aws_config_config_rule" "rds_snapshot_encryption" {
#   name        = "rds-snapshot-encryption"
#   description = "Ensure RDS snapshots are encrypted."
#   source {
#     owner             = "AWS"
#     source_identifier = "RDS_SNAPSHOT_ENCRYPTED"
#   }
# }

# # 8. ebs-snapshot-encryption (Ensure EBS Snapshots are Encrypted)
# resource "aws_config_config_rule" "ebs_snapshot_encryption" {
#   name        = "ebs-snapshot-encryption"
#   description = "Ensure EBS snapshots are encrypted."
#   source {
#     owner             = "AWS"
#     source_identifier = "EC2_EBS_SNAPSHOT_ENCRYPTION"
#   }
# }

# #rule ebs_snapshot_encryption when resourceType == "AWS::EC2::Snapshot" {
# #    configuration.encrypted == true
# #}

# # 9. cloudtrail-enabled (Ensure CloudTrail is Enabled)
# resource "aws_config_config_rule" "cloudtrail_enabled" {
#   name        = "cloudtrail-enabled"
#   description = "Ensure AWS CloudTrail is enabled."
#   source {
#     owner             = "AWS"
#     source_identifier = "CLOUD_TRAIL_ENABLED"
#   }
# }

# # 10. vpc-flow-logs-enabled (Ensure VPC Flow Logs are Enabled)
# resource "aws_config_config_rule" "vpc_flow_logs_enabled" {
#   name        = "vpc-flow-logs-enabled"
#   description = "Ensure VPC Flow Logs are enabled."
#   source {
#     owner             = "AWS"
#     source_identifier = "VPC_FLOW_LOGS_ENABLED"
#   }
# }

# # 11. no-public-s3-buckets (Ensure S3 Buckets Are Not Public)
# resource "aws_config_config_rule" "no_public_s3_buckets" {
#   name        = "no-public-s3-buckets"
#   description = "Ensure S3 buckets do not allow public access."
#   source {
#     owner             = "AWS"
#     source_identifier = "S3_BUCKET_PUBLIC_READ_PROHIBITED"
#   }
# }

# # 12. rds-public-access-check (Ensure RDS Instances Are Not Publicly Accessible)
# resource "aws_config_config_rule" "rds_public_access_check" {
#   name        = "rds-public-access-check"
#   description = "Ensure RDS instances are not publicly accessible."
#   source {
#     owner             = "AWS"
#     source_identifier = "RDS_INSTANCE_PUBLIC_ACCESS_CHECK"
#   }
# }

# # 13. root-account-mfa-enabled (Ensure Root Account MFA is Enabled)
# resource "aws_config_config_rule" "root_account_mfa_enabled" {
#   name        = "root-account-mfa-enabled"
#   description = "Ensure MFA is enabled for the root account."
#   source {
#     owner             = "AWS"
#     source_identifier = "ROOT_ACCOUNT_MFA_ENABLED"
#   }
# }

# # 14. s3-bucket-logging (Ensure S3 Bucket Logging is Enabled)
# resource "aws_config_config_rule" "s3_bucket_logging" {
#   name        = "s3-bucket-logging"
#   description = "Ensure S3 bucket logging is enabled."
#   source {
#     owner             = "AWS"
#     source_identifier = "S3_BUCKET_LOGGING_ENABLED"
#   }
# }

# # 15. ec2-managed-instance-patching (Ensure EC2 Instances are Managed for Patching)
# resource "aws_config_config_rule" "ec2_managed_instance_patching" {
#   name        = "ec2-managed-instance-patching"
#   description = "Ensure EC2 instances are managed for patching."
#   source {
#     owner             = "AWS"
#     source_identifier = "MANAGED_INSTANCE_PATCH_COMPLIANCE"
#   }
# }

# # 16. efs-encrypted (Ensure EFS File Systems are Encrypted)
# resource "aws_config_config_rule" "efs_encrypted" {
#   name        = "efs-encrypted"
#   description = "Ensure EFS file systems are encrypted."
#   source {
#     owner             = "AWS"
#     source_identifier = "EFS_ENCRYPTED_CHECK"
#   }
# }

# # 17. elb-security-policy (Ensure ELB Uses a Secure Security Policy)
# resource "aws_config_config_rule" "elb_security_policy" {
#   name        = "elb-security-policy"
#   description = "Ensure ELB is using a secure security policy."
#   source {
#     owner             = "AWS"
#     source_identifier = "ELB_SECURITY_POLICY_SSL_CHECK"
#   }
# }

# # 18. lambda-function-vpc-check (Ensure Lambda Functions are within a VPC)
# resource "aws_config_config_rule" "lambda_function_vpc_check" {
#   name        = "lambda-function-vpc-check"
#   description = "Ensure Lambda functions are within a VPC."
#   source {
#     owner             = "AWS"
#     source_identifier = "LAMBDA_FUNCTION_IN_VPC"
#   }
# }

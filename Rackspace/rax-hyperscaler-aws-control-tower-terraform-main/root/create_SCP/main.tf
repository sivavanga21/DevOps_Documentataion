variable "policy_name" {
  description = "The name of the AWS Organizations policy"
  type        = string
} 
resource "aws_organizations_policy" "deny_cloudtrail_deletion" {
  name        = var.policy_name
  description = "all base scps"
  content     = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Deny",
      "Action": [
        "cloudtrail:DeleteTrail",
        "cloudtrail:StopLogging"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Deny",
      "Action": [
        "config:DeleteConfigurationRecorder",
        "config:StopConfigurationRecorder"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Deny",
      "Action": [
        "iam:UpdateAssumeRolePolicy",
        "iam:DeleteRole",
        "iam:DeleteRolePolicy",
        "iam:DetachRolePolicy"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Deny",
      "Action": [
        "iam:CreateUser",
        "iam:CreateAccessKey"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Deny",
      "Action": "ec2:TerminateInstances",
      "Resource": "*",
      "Condition": {
        "StringEquals": {
          "aws:RequestTag/Environment": "Production"
        }
      }
    },
    {
      "Effect": "Deny",
      "Action": "s3:DeleteBucket",
      "Resource": "arn:aws:s3:::critical-data-bucket"
    },
    {
      "Effect": "Deny",
      "Action": "iam:DeactivateMFADevice",
      "Resource": "arn:aws:iam::*:mfa/root-account-mfa-device"
    },
    {
      "Effect": "Deny",
      "Action": "*",
      "Resource": "*",
      "Condition": {
        "StringNotEquals": {
          "aws:RequestedRegion": [
            "us-east-1",
            "us-east-2",
            "us-west-1",
            "us-west-2",
            "ca-central-1",
            "eu-central-1",
            "eu-west-1",
            "eu-west-2",
            "eu-west-3",
            "eu-north-1"
          ]
        }
      }
    },
    {
      "Effect": "Deny",
      "Action": "ec2:CreateVolume",
      "Resource": "*",
      "Condition": {
        "Bool": {
          "ec2:Encrypted": "false"
        }
      }
    },
    {
      "Effect": "Deny",
      "Action": "ec2:RunInstances",
      "Resource": "*",
      "Condition": {
        "StringNotEquals": {
          "ec2:InstanceType": [
            "t2.micro",
            "m5.large"
          ]
        }
      }
    },
    {
      "Effect": "Deny",
      "Action": "iam:UpdateRoleDescription",
      "Resource": "*"
    },
    {
      "Effect": "Deny",
      "Action": "s3:CreateBucket",
      "Resource": "*",
      "Condition": {
        "Bool": {
          "aws:SecureTransport": "false"
        }
      }
    },
    {
      "Effect": "Deny",
      "Action": "ec2:AuthorizeSecurityGroupIngress",
      "Resource": "*",
      "Condition": {
        "IpAddress": {
          "aws:SourceIp": "0.0.0.0/0"
        },
        "NumericEquals": {
          "ec2:FromPort": 22
        }
      }
    },
    {
      "Effect": "Deny",
      "Action": "ec2:AuthorizeSecurityGroupIngress",
      "Resource": "*",
      "Condition": {
        "IpAddress": {
          "aws:SourceIp": "0.0.0.0/0"
        },
        "NumericEquals": {
          "ec2:FromPort": 3389
        }
      }
    },
    {
      "Effect": "Deny",
      "Action": [
        "logs:DeleteLogGroup",
        "logs:DeleteLogStream",
        "logs:PutRetentionPolicy"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Deny",
      "Action": "ec2:DeleteFlowLogs",
      "Resource": "*"
    },
    {
      "Effect": "Deny",
      "Action": "rds:CreateDBInstance",
      "Resource": "*",
      "Condition": {
        "Bool": {
          "rds:StorageEncrypted": "false"
        }
      }
    },
    {
      "Effect": "Deny",
      "Action": [
        "cloudtrail:UpdateTrail",
        "cloudtrail:StopLogging"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Deny",
      "Action": "s3:PutBucketVersioning",
      "Resource": "*",
      "Condition": {
        "StringEquals": {
          "s3:VersioningConfiguration.Status": "Suspended"
        }
      }
    },
    {
      "Effect": "Deny",
      "Action": "cloudformation:DeleteStack",
      "Resource": "*"
    },
    {
      "Effect": "Deny",
      "Action": "*",
      "Resource": "*",
      "Condition": {
        "StringEquals": {
          "aws:RequestedRegion": [
            "us-gov-east-1",
            "us-gov-west-1"
          ]
        }
      }
    },
    {
      "Effect": "Deny",
      "Action": "logs:PutRetentionPolicy",
      "Resource": "*"
    },
    {
      "Effect": "Deny",
      "Action": "cloudtrail:StopLogging",
      "Resource": "*"
    },
    {
      "Effect": "Deny",
      "Action": "iam:UpdateAccountPasswordPolicy",
      "Resource": "*"
    },
    {
      "Effect": "Deny",
      "Action": "cloudtrail:DeleteLogFile",
      "Resource": "*"
    }
  ]
}
POLICY

  type = "SERVICE_CONTROL_POLICY"
}

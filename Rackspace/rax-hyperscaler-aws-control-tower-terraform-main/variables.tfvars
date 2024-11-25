# Control Tower controls configuration for specific OUs or accounts
controls = [
  {
    control_names = [ 
      # Detective control behavior: Monitors and detects violations after resources are provisioned.
      "AWS-GR_EC2_INSTANCE_NO_PUBLIC_IP",   # Detect whether any Amazon EC2 instance has an associated public IPv4 address
      "AWS-GR_EC2_VOLUME_INUSE_CHECK",      # Detect whether Amazon EBS volumes are attached to Amazon EC2 instances
    ],
    organizational_unit_ids = ["ou_id/account_id"], # Specify the OU or account ID
  },
  {
    control_names = [ 
      # Preventive control behavior: Prevents the creation of non-compliant resources.
      "AWS-GR_RESTRICT_ROOT_USER",          # Require encryption of attached Amazon EBS volumes for data at rest
      "AWS-GR_DISALLOW_VPN_CONNECTIONS",    # Disallow Amazon Virtual Private Network (VPN) connections
    ],
    organizational_unit_ids = ["ou_id/account_id"], # Specify the OU or account ID
  },
  {
    control_names = [ 
      # Proactive control behavior: Actively enforces compliance by blocking policy violations during resource provisioning.
      "AWS-GR_DISALLOW_VPC_INTERNET_ACCESS", # Require applications to restrict internet access via VPC
    ],
    organizational_unit_ids = ["ou_id/account_id"], # Specify the OU or account ID
  },
]

# Define the policy IDs and target ID for SCP attachment
policy_ids = [
  "p-wq72t3ti"  # Deny of Region
  #"p-22230gpd",  # Deny IAM New Users
  #"p-3214k2y"  # Deny Terminate Ec2
]

target_id = "ou_id/account_id"  # Replace with your actual OU ID

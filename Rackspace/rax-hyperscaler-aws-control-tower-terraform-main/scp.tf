resource "aws_organizations_policy_attachment" "attach_scp" {
  for_each = toset(var.policy_ids)  # Loop through each policy ID

  policy_id = each.key  # Use the current policy ID from the loop
  target_id = var.target_id  # Referencing the target_id variable
}


# resource "aws_organizations_policy_attachment" "attach_scp_non_prod" {
#   policy_id = var.policy_id  # Referencing the policy_id variable
#   target_id = var.target_id  # Referencing the target_id variable
# }


# resource "aws_organizations_policy_attachment" "attach_custom_scp_security_1" {
#   policy_id = "p-obodik2y"  # Another Custom SCP ID for Security OU
#   #target_id = "ou-zl72-el3o3ztr"  # Security OU ID
#   target_id = "971422718413"  # Security OU ID
# }

# resource "aws_organizations_policy_attachment" "attach_custom_scp_security_2" {
#   policy_id = "var.policy_id"  # Another Custom SCP ID for Security OU
#   target_id = "var.ou_id"  # Security OU ID
# }



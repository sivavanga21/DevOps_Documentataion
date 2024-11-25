output "ous_id_to_arn_map" {
  value       = local.ous_id_to_arn_map
  description = "Map from OU id to OU arn for the whole organization"
}

output "applied_controls" {
  value = var.controls
  description = "List of AWS Control Tower Guardrails applied for the organization"
}

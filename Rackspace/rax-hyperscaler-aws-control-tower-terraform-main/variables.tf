variable "controls" {
  type = list(object({
    control_names           = list(string)
    organizational_unit_ids = list(string)
  }))
  description = "Configuration of AWS Control Tower Guardrails for the whole organization"
}

variable "policy_ids" {
  description = "List of Service Control Policy IDs to attach."
  type        = list(string)
}

variable "target_id" {
  description = "The ID of the Organizational Unit or account to which the policy will be attached."
  type        = string
}

output "role_definition_id" {
  value       = azurerm_role_definition.xc.role_definition_resource_id
  description = <<-EOD
  The role definition ID for the custom role.
  EOD
}

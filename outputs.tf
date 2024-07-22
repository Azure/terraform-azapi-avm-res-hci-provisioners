# Module owners should include the full resource via a 'resource' output
# https://azure.github.io/Azure-Verified-Modules/specs/terraform/#id-tffr2---category-outputs---additional-terraform-outputs
output "resource" {
  description = "This is the full output for the resource."
  value       = azurerm_resource_group.rg # TODO: Replace this dummy resource azurerm_resource_group.TODO with your module resource
}

output "resource_id" {
  description = "This is the resource id for the resource."
  value       = azurerm_resource_group.rg.id
}

output "servers" {
  description = "avm-ptn-hci-server-provisioner"
  value       = module.servers
}

# TODO: Replace this dummy resource azurerm_resource_group.TODO with your module resource
resource "azurerm_resource_group" "rg" {
  location = var.location
  name     = local.resource_group_name
  tags = {
    site_id = var.site_id
  }

  depends_on = [
    data.external.lnet_ip_check
  ]

  lifecycle {
    ignore_changes = [tags]
  }
}

# required AVM resources interfaces
resource "azurerm_management_lock" "this" {
  count = var.lock != null ? 1 : 0

  lock_level = var.lock.kind
  name       = coalesce(var.lock.name, "lock-${var.lock.kind}")
  scope      = azurerm_resource_group.rg.id # TODO: Replace with your azurerm resource name
  notes      = var.lock.kind == "CanNotDelete" ? "Cannot delete the resource or its child resources." : "Cannot delete or modify the resource or its child resources."
}

resource "azurerm_role_assignment" "this" {
  for_each = var.role_assignments

  principal_id                           = each.value.principal_id
  scope                                  = azurerm_resource_group.rg.id # TODO: Replace this dummy resource azurerm_resource_group.TODO with your module resource
  condition                              = each.value.condition
  condition_version                      = each.value.condition_version
  delegated_managed_identity_resource_id = each.value.delegated_managed_identity_resource_id
  role_definition_id                     = strcontains(lower(each.value.role_definition_id_or_name), lower(local.role_definition_resource_substring)) ? each.value.role_definition_id_or_name : null
  role_definition_name                   = strcontains(lower(each.value.role_definition_id_or_name), lower(local.role_definition_resource_substring)) ? null : each.value.role_definition_id_or_name
  skip_service_principal_aad_check       = each.value.skip_service_principal_aad_check
}

data "azurerm_client_config" "current" {}

module "servers" {
  for_each = {
    for index, server in var.servers :
    server.name => server.ipv4Address
  }
  depends_on               = [terraform_data.ad_creation_provisioner, azurerm_resource_group.rg]
  source                   = "./modules/hci-server"
  resource_group_name      = azurerm_resource_group.rg.name
  server_name              = each.key
  local_admin_user         = var.local_admin_user
  local_admin_password     = var.local_admin_password
  authentication_method    = var.authentication_method
  server_ip                = var.virtual_host_ip == "" ? each.value : var.virtual_host_ip
  winrm_port               = var.virtual_host_ip == "" ? 5985 : var.serverPorts[each.key]
  subscription_id          = var.subscription_id
  location                 = azurerm_resource_group.rg.location
  tenant                   = data.azurerm_client_config.current.tenant_id
  service_principal_id     = var.service_principal_id
  service_principal_secret = var.service_principal_secret
  expandC                  = var.virtual_host_ip == "" ? false : true
}

resource "terraform_data" "replacement" {
  input = var.resource_group.name
}


## Section to provide a random Azure region for the resource group
# This allows us to randomize the region for the resource group.
module "regions" {
  source  = "Azure/regions/azurerm"
  version = "~> 0.3"
}

# This allows us to randomize the region for the resource group.
resource "random_integer" "region_index" {
  max = length(module.regions.regions) - 1
  min = 0
}
## End of section to provide a random Azure region for the resource group

# This ensures we have unique CAF compliant names for our resources.
module "naming" {
  source  = "Azure/naming/azurerm"
  version = "~> 0.3"
}

# This is required for resource modules
resource "azurerm_resource_group" "rg" {
  location = "eastus"
  name     = module.naming.resource_group.name_unique
}

variable "runnumber" {
  description = "The run number"
  type        = string
}

variable "private_ip" {
  description = "value of private ip"
  type        = string
}

# This is the module call
# Do not specify location here due to the randomization above.
# Leaving location as `null` will cause the module to use the resource group location
# with a data source.
module "test" {
  source = "../../"
  # source             = "Azure/avm-<res/ptn>-<name>/azurerm"
  # ...
  location            = azurerm_resource_group.rg.location
  name                = "TODO" # TODO update with module.naming.<RESOURCE_TYPE>.name_unique
  resource_group_name = azurerm_resource_group.rg.name

  enable_telemetry = var.enable_telemetry # see variables.tf
  // Beginning of specific varible for virtual environment
  dc_port = 6985
  serverPorts = {
    "AzSHOST1" = 15985,
    "AzSHOST2" = 25985
  }
  virtual_host_ip = var.private_ip


  adou_suffix              = "DC=jumpstart,DC=local"
  subscription_id          = var.subscription_id
  authentication_method    = "Credssp"
  domain_fqdn              = "jumpstart.local"
  deployment_user_password = var.deployment_user_password
  domain_admin_user        = var.domain_admin_user
  domain_admin_password    = var.domain_admin_password
  local_admin_user         = var.local_admin_user
  local_admin_password     = var.local_admin_password
  service_principal_id     = var.service_principal_id
  service_principal_secret = var.service_principal_secret
  cluster_name             = local.cluster_name
  starting_address         = "192.168.1.55"
  ending_address           = "192.168.1.65"
  servers = [
    {
      name        = "AzSHOST1",
      ipv4Address = "192.168.1.12"
    },
    {
      name        = "AzSHOST2",
      ipv4Address = "192.168.1.13"
    }
  ]
  resource_group        = azurerm_resource_group.rg
  deployment_user       = local.deployment_user
  domain_server_ip      = "192.168.1.254"
  adou_path             = local.adou_path
  lnet_starting_address = "192.168.1.171"
  lnet_ending_address   = "192.168.1.190"
  site_id               = local.site_id
}

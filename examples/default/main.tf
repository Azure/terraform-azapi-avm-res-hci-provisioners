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
  dcPort = 6985
  serverPorts = {
    "AzSHOST1" = 15985,
    "AzSHOST2" = 25985
  }
  virtualHostIp = var.private_ip


  adouSuffix             = "DC=jumpstart,DC=local"
  subscriptionId         = var.subscriptionId
  authenticationMethod   = "Credssp"
  domainFqdn             = "jumpstart.local"
  deploymentUserPassword = var.deploymentUserPassword
  domainAdminUser        = var.domainAdminUser
  domainAdminPassword    = var.domainAdminPassword
  localAdminUser         = var.localAdminUser
  localAdminPassword     = var.localAdminPassword
  servicePrincipalId     = var.servicePrincipalId
  servicePrincipalSecret = var.servicePrincipalSecret
  clusterName            = local.clusterName
  startingAddress        = "192.168.1.55"
  endingAddress          = "192.168.1.65"
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
  resourceGroup        = azurerm_resource_group.rg
  deploymentUser       = local.deploymentUserName
  domainServerIP       = "192.168.1.254"
  adouPath             = local.adouPath
  lnet-startingAddress = "192.168.1.171"
  lnet-endingAddress   = "192.168.1.190"
  lnet-addressPrefix   = "192.168.1.0/24"
  siteId               = local.siteId
}

<!-- BEGIN_TF_DOCS -->
# Default example

This deploys the module in its simplest form.

```hcl
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


  adou_suffix              = "DC=jumpstart,DC=local"
  subscriptionId           = var.subscriptionId
  authenticationMethod     = "Credssp"
  domainFqdn               = "jumpstart.local"
  deployment_user_password = var.deployment_user_password
  domainAdminUser          = var.domainAdminUser
  domainAdminPassword      = var.domainAdminPassword
  localAdminUser           = var.localAdminUser
  localAdminPassword       = var.localAdminPassword
  servicePrincipalId       = var.servicePrincipalId
  servicePrincipalSecret   = var.servicePrincipalSecret
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
  resourceGroup         = azurerm_resource_group.rg
  deployment_user       = local.deployment_user_name
  domainServerIP        = "192.168.1.254"
  adou_path             = local.adou_path
  lnet_starting_address = "192.168.1.171"
  lnet_ending_address   = "192.168.1.190"
  site_id               = local.site_id
}
```

<!-- markdownlint-disable MD033 -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.5)

- <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) (~> 1.13)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (~> 3.74)

- <a name="requirement_modtm"></a> [modtm](#requirement\_modtm) (~> 0.3)

- <a name="requirement_random"></a> [random](#requirement\_random) (~> 3.5)

## Resources

The following resources are used by this module:

- [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) (resource)
- [random_integer.region_index](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/integer) (resource)

<!-- markdownlint-disable MD013 -->
## Required Inputs

The following input variables are required:

### <a name="input_deployment_user_password"></a> [deployment\_user\_password](#input\_deployment\_user\_password)

Description: The password for deployment user.

Type: `string`

### <a name="input_domainAdminPassword"></a> [domainAdminPassword](#input\_domainAdminPassword)

Description: The password of the domain account.

Type: `string`

### <a name="input_domainAdminUser"></a> [domainAdminUser](#input\_domainAdminUser)

Description: The username of the domain account.

Type: `string`

### <a name="input_localAdminPassword"></a> [localAdminPassword](#input\_localAdminPassword)

Description: The password of the local administrator account.

Type: `string`

### <a name="input_localAdminUser"></a> [localAdminUser](#input\_localAdminUser)

Description: The username of the local administrator account.

Type: `string`

### <a name="input_private_ip"></a> [private\_ip](#input\_private\_ip)

Description: value of private ip

Type: `string`

### <a name="input_runnumber"></a> [runnumber](#input\_runnumber)

Description: The run number

Type: `string`

### <a name="input_servicePrincipalId"></a> [servicePrincipalId](#input\_servicePrincipalId)

Description: The id of service principal to create hci cluster.

Type: `string`

### <a name="input_servicePrincipalSecret"></a> [servicePrincipalSecret](#input\_servicePrincipalSecret)

Description: The secret of service principal to create hci cluster.

Type: `string`

### <a name="input_subscriptionId"></a> [subscriptionId](#input\_subscriptionId)

Description: The subscription id to register this environment.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_adou_suffix"></a> [adou\_suffix](#input\_adou\_suffix)

Description: The suffix of Active Directory OU path.

Type: `string`

Default: `"DC=jumpstart,DC=local"`

### <a name="input_domainJoinPassword"></a> [domainJoinPassword](#input\_domainJoinPassword)

Description: Password of User with permissions to join the domain.

Type: `string`

Default: `"!!123abc!!123abc"`

### <a name="input_enable_telemetry"></a> [enable\_telemetry](#input\_enable\_telemetry)

Description: This variable controls whether or not telemetry is enabled for the module.  
For more information see <https://aka.ms/avm/telemetryinfo>.  
If it is set to false, then no telemetry will be collected.

Type: `bool`

Default: `true`

### <a name="input_rpServicePrincipalObjectId"></a> [rpServicePrincipalObjectId](#input\_rpServicePrincipalObjectId)

Description: The object ID of the HCI resource provider service principal.

Type: `string`

Default: `""`

### <a name="input_vmAdminPassword"></a> [vmAdminPassword](#input\_vmAdminPassword)

Description: Admin password for the VM

Type: `string`

Default: `"!!123abc!!123abc"`

## Outputs

No outputs.

## Modules

The following Modules are called:

### <a name="module_naming"></a> [naming](#module\_naming)

Source: Azure/naming/azurerm

Version: ~> 0.3

### <a name="module_regions"></a> [regions](#module\_regions)

Source: Azure/regions/azurerm

Version: ~> 0.3

### <a name="module_test"></a> [test](#module\_test)

Source: ../../

Version:

<!-- markdownlint-disable-next-line MD041 -->
## Data Collection

The software may collect information about you and your use of the software and send it to Microsoft. Microsoft may use this information to provide services and improve our products and services. You may turn off the telemetry as described in the repository. There are also some features in the software that may enable you and Microsoft to collect data from users of your applications. If you use these features, you must comply with applicable law, including providing appropriate notices to users of your applications together with a copy of Microsoft’s privacy statement. Our privacy statement is located at <https://go.microsoft.com/fwlink/?LinkID=824704>. You can learn more about data collection and use in the help documentation and our privacy statement. Your use of the software operates as your consent to these practices.
<!-- END_TF_DOCS -->
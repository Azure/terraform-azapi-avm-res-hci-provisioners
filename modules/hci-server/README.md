<!-- BEGIN_TF_DOCS -->


<!-- markdownlint-disable MD033 -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.5)

- <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) (~> 1.13)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (~>3.0)

- <a name="requirement_random"></a> [random](#requirement\_random) (~>3.0)

## Resources

The following resources are used by this module:

- [terraform_data.provisioner](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) (resource)
- [terraform_data.replacement](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) (resource)

<!-- markdownlint-disable MD013 -->
## Required Inputs

The following input variables are required:

### <a name="input_localAdminPassword"></a> [localAdminPassword](#input\_localAdminPassword)

Description: The password for the local administrator account.

Type: `string`

### <a name="input_localAdminUser"></a> [localAdminUser](#input\_localAdminUser)

Description: The username for the local administrator account.

Type: `string`

### <a name="input_location"></a> [location](#input\_location)

Description: The Azure region where the resources will be deployed.

Type: `string`

### <a name="input_resourceGroupName"></a> [resourceGroupName](#input\_resourceGroupName)

Description: The name of the resource group.

Type: `string`

### <a name="input_serverIP"></a> [serverIP](#input\_serverIP)

Description: The IP address of the server.

Type: `string`

### <a name="input_serverName"></a> [serverName](#input\_serverName)

Description: The name of the server.

Type: `string`

### <a name="input_servicePrincipalId"></a> [servicePrincipalId](#input\_servicePrincipalId)

Description: The service principal ID for the Azure account.

Type: `string`

### <a name="input_servicePrincipalSecret"></a> [servicePrincipalSecret](#input\_servicePrincipalSecret)

Description: The service principal secret for the Azure account.

Type: `string`

### <a name="input_subscriptionId"></a> [subscriptionId](#input\_subscriptionId)

Description: The subscription ID for the Azure account.

Type: `string`

### <a name="input_tenant"></a> [tenant](#input\_tenant)

Description: The tenant ID for the Azure account.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_authenticationMethod"></a> [authenticationMethod](#input\_authenticationMethod)

Description: The authentication method for Enter-PSSession.

Type: `string`

Default: `"Default"`

### <a name="input_expandC"></a> [expandC](#input\_expandC)

Description: n/a

Type: `bool`

Default: `false`

### <a name="input_winrmPort"></a> [winrmPort](#input\_winrmPort)

Description: WinRM port

Type: `number`

Default: `5985`

## Outputs

No outputs.

## Modules

No modules.

<!-- END_TF_DOCS -->
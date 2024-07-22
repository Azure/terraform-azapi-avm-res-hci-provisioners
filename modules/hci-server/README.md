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

### <a name="input_local_admin_password"></a> [local\_admin\_password](#input\_local\_admin\_password)

Description: The password for the local administrator account.

Type: `string`

### <a name="input_local_admin_user"></a> [local\_admin\_user](#input\_local\_admin\_user)

Description: The username for the local administrator account.

Type: `string`

### <a name="input_location"></a> [location](#input\_location)

Description: The Azure region where the resources will be deployed.

Type: `string`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: The name of the resource group.

Type: `string`

### <a name="input_server_ip"></a> [server\_ip](#input\_server\_ip)

Description: The IP address of the server.

Type: `string`

### <a name="input_server_name"></a> [server\_name](#input\_server\_name)

Description: The name of the server.

Type: `string`

### <a name="input_service_principal_id"></a> [service\_principal\_id](#input\_service\_principal\_id)

Description: The service principal ID for the Azure account.

Type: `string`

### <a name="input_service_principal_secret"></a> [service\_principal\_secret](#input\_service\_principal\_secret)

Description: The service principal secret for the Azure account.

Type: `string`

### <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id)

Description: The subscription ID for the Azure account.

Type: `string`

### <a name="input_tenant"></a> [tenant](#input\_tenant)

Description: The tenant ID for the Azure account.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_authentication_method"></a> [authentication\_method](#input\_authentication\_method)

Description: The authentication method for Enter-PSSession.

Type: `string`

Default: `"Default"`

### <a name="input_expandC"></a> [expandC](#input\_expandC)

Description: n/a

Type: `bool`

Default: `false`

### <a name="input_winrm_port"></a> [winrm\_port](#input\_winrm\_port)

Description: WinRM port

Type: `number`

Default: `5985`

## Outputs

No outputs.

## Modules

No modules.

<!-- END_TF_DOCS -->
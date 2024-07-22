variable "local_admin_password" {
  type        = string
  description = "The password for the local administrator account."
}

variable "local_admin_user" {
  type        = string
  description = "The username for the local administrator account."
}

variable "location" {
  type        = string
  description = "The Azure region where the resources will be deployed."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "server_ip" {
  type        = string
  description = "The IP address of the server."
}

variable "server_name" {
  type        = string
  description = "The name of the server."
}

variable "service_principal_id" {
  type        = string
  description = "The service principal ID for the Azure account."
}

variable "service_principal_secret" {
  type        = string
  description = "The service principal secret for the Azure account."
}

variable "subscription_id" {
  type        = string
  description = "The subscription ID for the Azure account."
}

variable "tenant" {
  type        = string
  description = "The tenant ID for the Azure account."
}

variable "authentication_method" {
  type        = string
  default     = "Default"
  description = "The authentication method for Enter-PSSession."

  validation {
    condition     = can(regex("^(Default|Basic|Negotiate|NegotiateWithImplicitCredential|Credssp|Digest|Kerberos)$", var.authentication_method))
    error_message = "Value of authentication_method should be {Default | Basic | Negotiate | NegotiateWithImplicitCredential | Credssp | Digest | Kerberos}"
  }
}

variable "expandC" {
  type    = bool
  default = false
}

variable "winrm_port" {
  type        = number
  default     = 5985
  description = "WinRM port"
}

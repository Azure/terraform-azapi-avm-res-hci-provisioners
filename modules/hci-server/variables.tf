variable "localAdminPassword" {
  type        = string
  description = "The password for the local administrator account."
}

variable "localAdminUser" {
  type        = string
  description = "The username for the local administrator account."
}

variable "location" {
  type        = string
  description = "The Azure region where the resources will be deployed."
}

variable "resourceGroupName" {
  type        = string
  description = "The name of the resource group."
}

variable "serverIP" {
  type        = string
  description = "The IP address of the server."
}

variable "serverName" {
  type        = string
  description = "The name of the server."
}

variable "servicePrincipalId" {
  type        = string
  description = "The service principal ID for the Azure account."
}

variable "servicePrincipalSecret" {
  type        = string
  description = "The service principal secret for the Azure account."
}

variable "subscriptionId" {
  type        = string
  description = "The subscription ID for the Azure account."
}

variable "tenant" {
  type        = string
  description = "The tenant ID for the Azure account."
}

variable "authenticationMethod" {
  type        = string
  default     = "Default"
  description = "The authentication method for Enter-PSSession."

  validation {
    condition     = can(regex("^(Default|Basic|Negotiate|NegotiateWithImplicitCredential|Credssp|Digest|Kerberos)$", var.authenticationMethod))
    error_message = "Value of authenticationMethod should be {Default | Basic | Negotiate | NegotiateWithImplicitCredential | Credssp | Digest | Kerberos}"
  }
}

variable "expandC" {
  type    = bool
  default = false
}

variable "winrmPort" {
  type        = number
  default     = 5985
  description = "WinRM port"
}

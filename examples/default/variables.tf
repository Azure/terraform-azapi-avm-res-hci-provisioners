variable "deployment_user_password" {
  type        = string
  description = "The password for deployment user."
}

variable "domain_admin_password" {
  type        = string
  description = "The password of the domain account."
}

variable "domain_admin_user" {
  type        = string
  description = "The username of the domain account."
}

variable "local_admin_password" {
  type        = string
  description = "The password of the local administrator account."
}

variable "local_admin_user" {
  type        = string
  description = "The username of the local administrator account."
}

variable "service_principal_id" {
  type        = string
  description = "The id of service principal to create hci cluster."
}

variable "service_principal_secret" {
  type        = string
  description = "The secret of service principal to create hci cluster."
}

variable "subscription_id" {
  type        = string
  description = "The subscription id to register this environment."
}

variable "domainJoinPassword" {
  type        = string
  default     = "!!123abc!!123abc"
  description = "Password of User with permissions to join the domain."
}

variable "enable_telemetry" {
  type        = bool
  default     = true
  description = <<DESCRIPTION
This variable controls whether or not telemetry is enabled for the module.
For more information see <https://aka.ms/avm/telemetryinfo>.
If it is set to false, then no telemetry will be collected.
DESCRIPTION
}

variable "rp_service_principal_object_id" {
  type        = string
  default     = ""
  description = "The object ID of the HCI resource provider service principal."
}

variable "vm_admin_password" {
  type        = string
  default     = "!!123abc!!123abc"
  description = "Admin password for the VM"
}

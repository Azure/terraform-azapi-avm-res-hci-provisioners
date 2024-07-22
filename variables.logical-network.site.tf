variable "lnet_starting_address" {
  type        = string
  description = "The starting IP address of the IP address range of the logical network, this can be omit if using existing logical network"
}

variable "lnet_ending_address" {
  type        = string
  description = "The ending IP address of the IP address range of the logical network, this can be omit if using existing logical network"
}


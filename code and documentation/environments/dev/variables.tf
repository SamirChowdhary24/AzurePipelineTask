# Azure location
variable "location" {
  description = "The Azure region to deploy resources in."
  type        = string
}

# Resource Group
variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

# Subnet address prefixes
variable "public_subnet_address_prefixes" {
  description = "List of address prefixes for the public subnet."
  type        = list(string)
}

variable "private_subnet_address_prefixes" {
  description = "List of address prefixes for the private subnet."
  type        = list(string)
}

# VM Configuration
variable "vm_size" {
  description = "The size of the virtual machine."
  type        = string
  default     = "Standard_B1s"
}

variable "admin_password" {
  description = "Admin password for the VM."
  type        = string
  sensitive   = true
}

variable "vm_count" {
  description = "Number of virtual machines to deploy."
  type        = number
  default     = 1
}

# SSL Certificate
variable "cert_pfx_password" {
  description = "Password for the SSL certificate PFX file."
  type        = string
  sensitive   = true
}

# Subscription ID
variable "subscription_id" {
  description = "Azure Subscription ID."
  type        = string
}

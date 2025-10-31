variable "subscription_id" {
  description = "Azure Subscription ID for resource deployment."
  type        = string
}

variable "location" {
  description = "Azure region for resource deployment."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name for production environment."
  type        = string
}

variable "vnet_cidr_block" {
  description = "CIDR block for the virtual network."
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "CIDR ranges for public subnets."
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR ranges for private subnets."
  type        = list(string)
}

variable "security_rules" {
  description = "List of security rules for the NSG."
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}

variable "vm_size" {
  description = "Size of the virtual machines."
  type        = string
}

variable "admin_password" {
  description = "Admin password for the virtual machines."
  type        = string
  sensitive   = true
}

variable "vm_count" {
  description = "Number of VMs to create."
  type        = number
}

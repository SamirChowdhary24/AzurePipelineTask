variable "subscription_id" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "public_subnet_address_prefixes" {
  type = list(string)
}

variable "private_subnet_address_prefixes" {
  type = list(string)
}

variable "vm_size" {
  type    = string
  default = "Standard_B2s"
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "vm_count" {
  type    = number
  default = 2
}

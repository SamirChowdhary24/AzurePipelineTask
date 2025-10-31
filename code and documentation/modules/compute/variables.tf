variable "vm_count" {
  type = number
}

variable "environment" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "private_subnet_id" {
  type = string
}

variable "nsg_id" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "vm_publisher" {
  type = string
}

variable "vm_offer" {
  type = string
}

variable "vm_sku" {
  type = string
}

variable "vm_version" {
  type = string
}

variable "disk_type" {
  type = string
}

variable "os_disk_caching" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "user_data_script" {
  type = string
}

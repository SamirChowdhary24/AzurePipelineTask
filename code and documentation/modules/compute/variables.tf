# Environment and Resource Group
variable "env_name" {
  description = "Name of the environment (e.g., dev, prod)"
  type        = string
}

variable "azure_region" {
  description = "Azure region for deployment"
  type        = string
}

variable "rg_name" {
  description = "Resource group name"
  type        = string
}

# Network Interface
variable "instance_count" {
  description = "Number of virtual machines to create"
  type        = number
  default     = 1
}

variable "ip_config_name" {
  description = "Name for IP configuration block"
  type        = string
  default     = "internal"
}

variable "subnet_id" {
  description = "Subnet ID to attach the NIC"
  type        = string
}

variable "private_ip_allocation" {
  description = "Private IP allocation method (Dynamic or Static)"
  type        = string
  default     = "Dynamic"
}

variable "network_security_group_id" {
  description = "NSG ID to associate with NIC"
  type        = string
}

# Virtual Machine Configuration
variable "instance_size" {
  description = "Size of the virtual machine"
  type        = string
}

# OS Image Configuration
variable "vm_image_publisher" {
  description = "VM image publisher"
  type        = string
}

variable "vm_image_offer" {
  description = "VM image offer"
  type        = string
}

variable "vm_image_sku" {
  description = "VM image SKU"
  type        = string
}

variable "vm_image_version" {
  description = "VM image version"
  type        = string
  default     = "latest"
}

# OS Disk Configuration
variable "os_disk_name" {
  description = "Base name for OS disks"
  type        = string
  default     = "osdisk"
}

variable "os_disk_caching" {
  description = "Caching type for OS disk"
  type        = string
  default     = "ReadWrite"
}

variable "os_disk_create_option" {
  description = "Disk create option (e.g., FromImage)"
  type        = string
  default     = "FromImage"
}

variable "os_disk_type" {
  description = "Managed disk type (e.g., Standard_LRS, Premium_LRS)"
  type        = string
  default     = "Standard_LRS"
}

# Admin and User Data
variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
}

variable "vm_admin_password" {
  description = "Admin password for the VM"
  type        = string
  sensitive   = true
}

variable "custom_data_script" {
  description = "Custom data script to configure the VM"
  type        = string
  default     = null
}

variable "disable_password_authentication" {
  description = "Disable password authentication for Linux VMs"
  type        = bool
  default     = false
}

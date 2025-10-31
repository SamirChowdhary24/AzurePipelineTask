# Environment & Location
variable "env_prefix" {
  description = "Prefix used for naming resources (e.g., dev, prod)"
  type        = string
}

variable "azure_location" {
  description = "Azure region for resource deployment"
  type        = string
}

variable "rg_name" {
  description = "Resource Group name where resources will be created"
  type        = string
}

# Public IP Configuration
variable "public_ip_allocation_method" {
  description = "Public IP allocation method (Static or Dynamic)"
  type        = string
  default     = "Static"
}

variable "public_ip_sku" {
  description = "Public IP SKU (e.g., Basic, Standard)"
  type        = string
  default     = "Standard"
}

# Application Gateway SKU
variable "app_gateway_sku_name" {
  description = "Name of the Application Gateway SKU"
  type        = string
}

variable "app_gateway_sku_tier" {
  description = "Tier of the Application Gateway SKU"
  type        = string
}

variable "app_gateway_sku_capacity" {
  description = "Capacity (instance count) for Application Gateway"
  type        = number
}

# Gateway IP Configuration
variable "gateway_ip_config_name" {
  description = "Name of the Application Gateway IP configuration"
  type        = string
}

variable "gateway_subnet_id" {
  description = "Subnet ID used for Application Gateway"
  type        = string
}

# Frontend Configuration
variable "frontend_port_name" {
  description = "Name of the frontend port configuration"
  type        = string
}

variable "frontend_port" {
  description = "Frontend port number"
  type        = number
}

variable "frontend_ip_config_name" {
  description = "Name of the frontend IP configuration"
  type        = string
}

# Backend Configuration
variable "backend_pool_name" {
  description = "Name of the backend address pool"
  type        = string
}

variable "backend_vm_ips" {
  description = "List of backend virtual machine IP addresses"
  type        = list(string)
}

# Backend HTTP Settings
variable "http_settings_name" {
  description = "Name of backend HTTP settings"
  type        = string
}

variable "http_settings_cookie_affinity" {
  description = "Cookie-based affinity setting (Enabled/Disabled)"
  type        = string
  default     = "Disabled"
}

variable "http_settings_port" {
  description = "Backend HTTP port"
  type        = number
}

variable "http_settings_protocol" {
  description = "Backend HTTP protocol (HTTP/HTTPS)"
  type        = string
  default     = "HTTP"
}

variable "http_settings_timeout" {
  description = "Request timeout in seconds for backend HTTP settings"
  type        = number
  default     = 30
}

variable "http_settings_host_name" {
  description = "Optional host name for backend HTTP settings"
  type        = string
  default     = null
}

# Listener Configuration
variable "listener_name" {
  description = "Name of the HTTP listener"
  type        = string
}

variable "listener_protocol" {
  description = "Protocol for the listener (HTTP or HTTPS)"
  type        = string
  default     = "HTTP"
}

# Request Routing Rule
variable "routing_rule_name" {
  description = "Name of the request routing rule"
  type        = string
}

variable "routing_rule_type" {
  description = "Routing rule type (Basic or PathBasedRouting)"
  type        = string
  default     = "Basic"
}

variable "routing_rule_priority" {
  description = "Priority number for routing rule"
  type        = number
  default     = 100
}

# Probe Configuration
variable "probe_name" {
  description = "Name of the health probe"
  type        = string
}

variable "probe_protocol" {
  description = "Probe protocol (HTTP/HTTPS)"
  type        = string
  default     = "HTTP"
}

variable "probe_host" {
  description = "Probe host name or IP"
  type        = string
}

variable "probe_path" {
  description = "Path to probe for health check"
  type        = string
}

variable "probe_interval" {
  description = "Probe interval in seconds"
  type        = number
  default     = 30
}

variable "probe_timeout" {
  description = "Probe timeout in seconds"
  type        = number
  default     = 30
}

variable "probe_unhealthy_threshold" {
  description = "Number of failed probes before marking unhealthy"
  type        = number
  default     = 3
}

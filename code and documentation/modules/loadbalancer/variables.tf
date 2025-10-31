variable "environment" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "public_subnet_id" {
  type = string
}

variable "backend_ip_addresses" {
  type = list(string)
}

variable "app_gateway_sku_name" {
  type = string
}

variable "app_gateway_sku_tier" {
  type = string
}

variable "app_gateway_capacity" {
  type = number
}

variable "gateway_ip_configuration_name" {
  type = string
}

variable "frontend_port_name" {
  type = string
}

variable "frontend_port" {
  type = number
}

variable "frontend_ip_configuration_name" {
  type = string
}

variable "backend_pool_name" {
  type = string
}

variable "backend_http_settings_name" {
  type = string
}

variable "cookie_based_affinity" {
  type = string
}

variable "backend_http_port" {
  type = number
}

variable "backend_http_protocol" {
  type = string
}

variable "request_timeout" {
  type = number
}

variable "probe_name" {
  type = string
}

variable "backend_host_name" {
  type = string
}

variable "http_listener_name" {
  type = string
}

variable "http_listener_protocol" {
  type = string
}

variable "request_routing_rule_name" {
  type = string
}

variable "rule_type" {
  type = string
}

variable "request_routing_rule_priority" {
  type = number
}

variable "probe_protocol" {
  type = string
}

variable "probe_host" {
  type = string
}

variable "probe_path" {
  type = string
}

variable "probe_interval" {
  type = number
}

variable "probe_timeout" {
  type = number
}

variable "probe_unhealthy_threshold" {
  type = number
}

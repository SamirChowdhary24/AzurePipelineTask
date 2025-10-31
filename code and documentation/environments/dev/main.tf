provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = "920ea4d7-bb2c-4572-b948-5970818f06c0"
}

module "networking" {
  source               = "../../modules/networking"
  env_tag              = "dev"
  region               = var.azure_region
  rg_name_override     = var.rg_name
  vnet_cidr_block      = var.vnet_cidr_block
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  security_rules       = var.security_rules
}

module "nginx_app" {
  source      = "../../modules/nginx"
  environment = "dev"
}

module "compute" {
  source                          = "../../modules/compute"
  env_name                        = "dev"
  azure_region                    = module.networking.location
  rg_name                         = module.networking.resource_group_name
  subnet_id                       = module.networking.private_subnet_id
  network_security_group_id       = module.networking.nsg_id
  instance_size                   = var.instance_type
  vm_admin_password               = var.vm_admin_password
  instance_count                  = var.instance_count
  custom_data_script              = module.nginx_app.user_data_script
  ip_config_name                  = var.ip_config_name
  private_ip_allocation           = var.private_ip_allocation
  vm_image_publisher              = var.vm_image_publisher
  vm_image_offer                  = var.vm_image_offer
  vm_image_sku                    = var.vm_image_sku
  vm_image_version                = var.vm_image_version
  os_disk_name                    = var.os_disk_name
  os_disk_caching                 = var.os_disk_caching
  os_disk_create_option           = var.os_disk_create_option
  os_disk_type                    = var.os_disk_type
  admin_username                  = var.admin_username
  disable_password_authentication = var.disable_password_authentication
}

module "loadbalancer" {
  source                        = "../../modules/loadbalancer"
  env_prefix                    = "dev"
  azure_location                = module.networking.location
  rg_name                       = module.networking.resource_group_name
  gateway_subnet_id             = module.networking.public_subnet_id
  backend_vm_ips                = module.compute.private_ips
  public_ip_allocation_method   = var.public_ip_allocation_method
  public_ip_sku                 = var.public_ip_sku
  app_gateway_sku_name          = var.app_gateway_sku_name
  app_gateway_sku_tier          = var.app_gateway_sku_tier
  app_gateway_sku_capacity      = var.app_gateway_sku_capacity
  gateway_ip_config_name        = var.gateway_ip_conf_

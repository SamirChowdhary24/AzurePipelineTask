provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

module "network" {
  source                          = "../../modules/networking"
  env_tag                         = "prod"
  region                          = var.location
  rg_name_override                = var.resource_group_name
  vnet_cidr_block                 = var.vnet_cidr_block
  public_subnet_cidrs             = var.public_subnet_cidrs
  private_subnet_cidrs            = var.private_subnet_cidrs
  security_rules                  = var.security_rules
}

module "nginx_app" {
  source      = "../../modules/nginx"
  environment = "prod"
}

module "compute" {
  source              = "../../modules/compute"
  environment         = "prod"
  location            = module.network.region
  resource_group_name = module.network.rg_name
  private_subnet_id   = module.network.private_subnet_id
  nsg_id              = module.network.nsg_id
  vm_size             = var.vm_size
  admin_password      = var.admin_password
  vm_count            = var.vm_count
  user_data_script    = module.nginx_app.user_data_script
}

module "loadbalancer" {
  source               = "../../modules/loadbalancer"
  environment          = "prod"
  location             = module.network.region
  resource_group_name  = module.network.rg_name
  public_subnet_id     = module.network.public_subnet_id
  backend_ip_addresses = module.compute.private_ips
}

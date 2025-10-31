environment                     = "prod"
location                        = "East US"
resource_group_name             = "rg-prod-loadbalancer"
public_subnet_id                = "/subscriptions/sub-id/resourceGroups/rg/providers/Microsoft.Network/virtualNetworks/vnet/subnets/publicsubnet"
backend_ip_addresses            = ["10.0.2.4", "10.0.2.5"]

app_gateway_sku_name            = "Standard_v2"
app_gateway_sku_tier            = "Standard_v2"
app_gateway_capacity            = 1

gateway_ip_configuration_name   = "default-config"
frontend_port_name              = "http-port"
frontend_port                   = 80
frontend_ip_configuration_name  = "default-frontend-ip"

backend_pool_name               = "backend-pool"
backend_http_settings_name      = "http-settings"
cookie_based_affinity           = "Disabled"
backend_http_port               = 80
backend_http_protocol           = "Http"
request_timeout                 = 60
probe_name                      = "health-probe"
backend_host_name               = "localhost"

http_listener_name              = "http-listener"
http_listener_protocol          = "Http"

request_routing_rule_name       = "routing-rule"
rule_type                       = "Basic"
request_routing_rule_priority   = 100

probe_protocol                  = "Http"
probe_host                      = "localhost"
probe_path                      = "/"
probe_interval                  = 30
probe_timeout                   = 30
probe_unhealthy_threshold       = 3

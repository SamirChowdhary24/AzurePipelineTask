subscription_id      = "920ea4d7-bb2c-4572-b948-5970818f06c0"
location             = "East US"
resource_group_name  = "rg-prod-environment"

vnet_cidr_block      = ["10.0.0.0/16"]
public_subnet_cidrs  = ["10.0.1.0/24"]
private_subnet_cidrs = ["10.0.2.0/24"]

security_rules = [
  {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  },
  {
    name                       = "AllowHTTP"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }
]

vm_size        = "Standard_B1s"
admin_password = "YourStrongPassword123!"
vm_count       = 2

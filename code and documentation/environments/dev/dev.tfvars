# Azure environment configuration
subscription_id = "920ea4d7-bb2c-4572-b948-5970818f06c0"
location         = "East US"
resource_group_name = "rg-dev-environment"

# Networking
public_subnet_address_prefixes  = ["10.0.1.0/24"]
private_subnet_address_prefixes = ["10.0.2.0/24"]

# Compute
vm_size        = "Standard_B1s"
admin_password = "YourSecureP@ssw0rd!"
vm_count       = 2

# SSL
cert_pfx_password = "YourCertPassword123"

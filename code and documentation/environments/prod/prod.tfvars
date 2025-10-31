subscription_id = "920ea4d7-bb2c-4572-b948-5970818f06c0"
location            = "East US"
resource_group_name = "rg-prod-environment"

public_subnet_address_prefixes  = ["10.0.1.0/24"]
private_subnet_address_prefixes = ["10.0.2.0/24"]

vm_size        = "Standard_B2s"
admin_password = "StrongP@ssword123!"
vm_count       = 3

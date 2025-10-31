vm_count            = 2
environment         = "prod"
location            = "East US"
resource_group_name = "rg-prod-compute"
private_subnet_id   = "/subscriptions/sub-id/resourceGroups/rg/providers/Microsoft.Network/virtualNetworks/vnet/subnets/privatesubnet"
nsg_id              = "/subscriptions/sub-id/resourceGroups/rg/providers/Microsoft.Network/networkSecurityGroups/nsg-name"
vm_size             = "Standard_B1s"
admin_username      = "adminuser"
admin_password      = "P@ssw0rd12345!"
user_data_script    = "#!/bin/bash\necho Hello from PROD VM"

vm_publisher        = "Canonical"
vm_offer            = "UbuntuServer"
vm_sku              = "18.04-LTS"
vm_version          = "latest"

disk_type           = "Standard_LRS"
os_disk_caching     = "ReadWrite"

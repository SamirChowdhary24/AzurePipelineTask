terraform {
  backend "azurerm" {
    resource_group_name  = "samboxxer-rg"
    storage_account_name = "samboxxer-starage"
    container_name       = "sam-container"
    key                  = "vnet-compute/dev.terraform.tfstate"
    use_azuread_auth     = true
  }
}
terraform {
  backend "azurerm" {
    resource_group_name   = var.resource_group-name
    storage_account_name  = var.storage_account-name
    container_name        = var.container-name
    key                   = "terraform.tfstate"
  }
}
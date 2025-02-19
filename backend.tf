terraform {
  backend "azurerm" {
    resource_group_name   = "1-434cb672-playground-sandbox"
    storage_account_name  = "azuredevopslabstrg"
    container_name        = "container1"
    key                   = "terraform.tfstate"
  }
}
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.19.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  subscription_id = var.subscription-id

  # Optional: Specify the tenant ID if you have multiple tenants
  tenant_id       = var.tenant-id
  # Optional: Specify the client ID and client secret for service principal authentication
  client_id       = var.client-id
  client_secret   = var.client-secret


}
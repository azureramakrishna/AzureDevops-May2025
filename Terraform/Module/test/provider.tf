terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = "d46e6eca-91fd-4b00-8467-61efcb383cc8"
  client_secret   = ""
  tenant_id       = "459865f1-a8aa-450a-baec-8b47a9e5c904"
}
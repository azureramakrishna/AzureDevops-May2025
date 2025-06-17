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
  client_id       = "42605662-8454-49ea-8ac5-fe7ba6d4ac00"
  use_oidc        = true   
  tenant_id       = "459865f1-a8aa-450a-baec-8b47a9e5c904"
}

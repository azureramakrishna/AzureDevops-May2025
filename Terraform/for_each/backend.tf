# Terraform backend configuration
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform"
    storage_account_name = "saanvikitterraform"
    container_name       = "tfstate"
    key                  = "github.terraform.tfstate"
  }
}

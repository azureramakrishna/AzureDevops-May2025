# Terraform backend configuration

terraform {
  backend "azurerm" {
    use_oidc             = true                                    # Can also be set via `ARM_USE_OIDC` environment variable.
    use_azuread_auth     = true                                    # Can also be set via `ARM_USE_AZUREAD` environment variable.
    tenant_id            = "459865f1-a8aa-450a-baec-8b47a9e5c904"  # Can also be set via `ARM_TENANT_ID` environment variable.
    client_id            = "42605662-8454-49ea-8ac5-fe7ba6d4ac00"  # Can also be set via `ARM_CLIENT_ID` environment variable.
    storage_account_name = "saanvikitterraform"                              # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                               # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "foreach.terraform.tfstate"                # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}

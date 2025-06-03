module "remotemodule" {
  source = "git::https://github.com/azureramakrishna/AzureDevops-May2025.git"

  resource_group_name  = var.resource_group_name
  tags                 = var.tags
  location             = var.location
  storage_account_name = var.storage_account_name
}
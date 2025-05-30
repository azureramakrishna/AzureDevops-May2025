variable "resource_group_name" {
  type        = string
  description = "Name of the first resource group"
}

variable "tags" {
  type        = map(string)
  description = "Tags to be applied to the resources"
}

variable "location" {
  type        = string
  description = "Name of the location"
}

variable "storage_account_name" {
  type        = list(string)
  description = "Name of the storage account"
}

variable "subscription_id" {
  type        = string
  description = "Subscription ID for the Azure account"
}
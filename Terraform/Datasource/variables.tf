variable "resource_group_name" {
  type        = string
  description = "Name of the first resource group"
}

variable "tags" {
  type        = map(string)
  description = "Tags to be applied to the resources"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account"
}

variable "subscription_id" {
  type        = string
  description = "Subscription ID for the Azure account"
}

variable "virtual_network_name" {
  type        = string
  description = "Name of the virtual network"
}

variable "subnet_name" {
  type = string
}

variable "network_security_group_name" {
  type = string
}

variable "public_ip_name" {
  type = string
}

variable "network_interface_name" {
  type = string
}

variable "virtual_machine_name" {
  type = string
}

variable "virtual_machine_size" {
  type = string
}

variable "adminUser" {
  type = string
}

variable "keyvault_name" {
  type = string
}

variable "keyvault_secret_name" {
  type = string
}
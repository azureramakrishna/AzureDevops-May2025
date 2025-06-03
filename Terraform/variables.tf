variable "resource_group_name" {
  type        = string
  description = "Name of the first resource group"
}

variable "location" {
  type        = string
  description = "Name of the location"
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

variable "virtual_network_address_space" {
  type    = list(string)
}

variable "subnet_address_prefixes" {
  type    = list(string)
}

variable "subnet_name" {
  type    = string
}

variable "network_security_group_name" {
  type    = string
}

variable "public_ip_name" {
  type    = string
}

variable "network_interface_name" {
  type    = string
}

variable "virtual_machine_name" {
  type    = string
}

variable "virtual_machine_size" {
  type    = string
}

variable "adminUser" {
  type    = string
}

variable "adminPassword" {
  type    = string
}




variable "resource_group_name_01" {
  type        = string
  description = "Name of the first resource group"
  default     = "terraform-resource-group-01"
}

variable "location" {
  type        = string
  description = "Name of the location"
  default     = "eastus"
}

variable "tags" {
  type        = map(string)
  description = "Tags to be applied to the resources"
  default = {
    environment = "DEV"
    project     = "terraform"
  }
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account"
  default     = "Terraformsa2205205"
}

variable "subscription_id" {
  type        = string
  description = "Subscription ID for the Azure account"
  default     = "2e28c82c-17d7-4303-b27a-4141b3d4088f"

}

variable "virtual_network_name" {
  type        = string
  description = "Name of the virtual network"
  default     = "terraform-vnet"
}

variable "virtual_network_address_space" {
  type    = list(string)
  default = ["10.0.0.0/24"]
}

variable "subnet_address_prefixes" {
  type    = list(string)
  default = ["10.0.0.0/24"]
}

variable "subnet_name" {
  type    = string
  default = "terraform-snet"
}

variable "network_security_group_name" {
  type    = string
  default = "terraform-nsg"
}

variable "public_ip_name" {
  type    = string
  default = "terraform-public-ip"
}

variable "network_interface_name" {
  type    = string
  default = "terraform-nic"
}

variable "virtual_machine_name" {
  type    = string
  default = "terraform-vm"
}

variable "virtual_machine_size" {
  type    = string
  default = "Standard_D2s_v3"
}

variable "adminUser" {
  type    = string
  default = "azureuser"
}

variable "adminPassword" {
  type    = string
  default = "Azuredevops@12345"
}

variable "count_value" {
  type    = number
  default = 5
}


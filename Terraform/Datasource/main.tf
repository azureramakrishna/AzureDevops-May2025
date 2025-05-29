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

# Terraform backend configuration
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform"
    storage_account_name = "saanvikitterraform"
    container_name       = "tfstate"
    key                  = "datasource.terraform.tfstate"
  }
}


# # Create a storage account
resource "azurerm_storage_account" "sa" {
  name                     = lower(var.storage_account_name)
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}

# Create a Network Security Group
resource "azurerm_network_security_group" "nsg" {
  name                = var.network_security_group_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  security_rule {
    name                       = "RDP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = var.tags
}

# Subnet association with NSG
resource "azurerm_subnet_network_security_group_association" "example" {
  depends_on = [ data.azurerm_subnet.snet, azurerm_network_security_group.nsg ]
  subnet_id                 = data.azurerm_subnet.snet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# Create a Public IP Address
resource "azurerm_public_ip" "pip" {
  name                = var.public_ip_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  allocation_method   = "Static"

  tags = var.tags
}

# Create a NIC
resource "azurerm_network_interface" "nic" {
  depends_on = [ data.azurerm_subnet.snet, azurerm_public_ip.pip ]
  name                = var.network_interface_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.snet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

# Create VM
resource "azurerm_windows_virtual_machine" "vm" {
  depends_on = [ azurerm_network_interface.nic, data.azurerm_key_vault_secret.secret ]
  name                = var.virtual_machine_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  size                = var.virtual_machine_size
  vm_agent_platform_updates_enabled = true
  admin_username      = var.adminUser
  admin_password      = data.azurerm_key_vault_secret.secret.value
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    name                 = "${var.virtual_machine_name}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}
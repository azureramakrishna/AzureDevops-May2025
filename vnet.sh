az group create --name test-rg --location eastus2

az network vnet create --name vnet-1 --resource-group test-rg --address-prefix 10.0.0.0/16 --subnet-name subnet-1 --subnet-prefixes 10.0.0.0/24
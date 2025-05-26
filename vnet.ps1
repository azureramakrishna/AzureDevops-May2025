# Create a resource group
$rg = @{
    Name = 'pwsh-rg'
    Location = 'UKSouth'
}
New-AzResourceGroup @rg

# Create a virtual network
$vnet = @{
    Name = 'pwsh-vnet-1'
    ResourceGroupName = 'pwsh-rg'
    Location = 'UKSouth'
    AddressPrefix = '172.16.0.0/24'
}
$virtualNetwork = New-AzVirtualNetwork @vnet

$subnet = @{
    Name = 'subnet-1'
    VirtualNetwork = $virtualNetwork
    AddressPrefix = '172.16.0.0/24'
}
$subnetConfig = Add-AzVirtualNetworkSubnetConfig @subnet

$virtualNetwork | Set-AzVirtualNetwork
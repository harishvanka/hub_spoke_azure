
resource "azurerm_virtual_network" "hub_vnet" {
  name                = "vnet-hub-emvptec-eastus"
  resource_group_name = "rg-hub-eastus"
  location            = "EastUS"
  address_space       = ["10.110.0.0/16"]
  tags = {
    environment = "HubVnet"
    createdby   = "Terraform"
    product     = "emvptec"
  }
}


resource "azurerm_subnet" "hub_vm_subnet" {
  name                 = "VMSubnet"
  resource_group_name  = "rg-hub-eastus"
  virtual_network_name = azurerm_virtual_network.hub_vnet.name
  address_prefixes     = ["10.110.60.0/24"]
}

resource "azurerm_subnet" "gateway_subnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = "rg-hub-eastus"
  virtual_network_name = azurerm_virtual_network.hub_vnet.name
  address_prefixes     = ["10.110.70.0/24"]
}

resource "azurerm_subnet" "bastion_subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = "rg-hub-eastus"
  virtual_network_name = azurerm_virtual_network.hub_vnet.name
  address_prefixes     = ["10.110.80.0/24"]
}

resource "azurerm_subnet" "firewall_subnet" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = "rg-hub-eastus"
  virtual_network_name = azurerm_virtual_network.hub_vnet.name
  address_prefixes     = ["10.110.90.0/24"]
}





output "hub_vnet_id" {
  value = azurerm_virtual_network.hub_vnet.id
}

output "hub_vnet_name" {
  value = azurerm_virtual_network.hub_vnet.name
}




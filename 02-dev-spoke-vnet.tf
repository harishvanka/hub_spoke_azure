resource "azurerm_virtual_network" "dev_spoke" {
  name                = "vnet-dev-spoke-emvptec-eastus"
  resource_group_name = "rg-hub-eastus"
  location            = "East US"
  address_space       = ["10.170.0.0/16"]
  tags = {
    environment = "DevSpokeVnet"
    createdby   = "Terraform"
    product     = "emvptec"
  }
}

resource "azurerm_subnet" "dev_default_subnet" {
  name                 = "DefaultSubnet"
  resource_group_name  = "rg-hub-eastus"
  virtual_network_name = azurerm_virtual_network.dev_spoke.name
  address_prefixes     = ["10.170.0.0/24"]
  private_endpoint_network_policies = "Enabled"

}

# resource "azurerm_subnet_network_security_group_association" "dev_snet_nsg_association" {
#   subnet_id                 = azurerm_subnet.dev_default_subnet.id
#   network_security_group_id = azurerm_network_security_group.dev_spoke_nsg.id
# }

# resource "azurerm_subnet_route_table_association" "dev_rt_association" {
#   subnet_id      = azurerm_subnet.dev_default_subnet.id
#   route_table_id = azurerm_route_table.dev_rt.id
# }

output "dev_spoke_vnet_id" {
  value = azurerm_virtual_network.dev_spoke.id
}

output "dev_spoke_vnet_name" {
  value = azurerm_virtual_network.dev_spoke.name
}
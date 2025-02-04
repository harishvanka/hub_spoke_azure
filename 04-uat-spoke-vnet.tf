resource "azurerm_virtual_network" "uat_spoke" {
  name                = "vnet-uat-spoke-emvptec-eastus"
  resource_group_name = "rg-hub-eastus"
  location            = "East US"
  address_space       = ["10.160.0.0/16"]
  tags = {
    environment = "UATSpokeVnet"
    createdby   = "Terraform"
    product     = "emvptec"
  }
}

resource "azurerm_subnet" "uat_default_subnet" {
  name                 = "DefaultSubnet"
  resource_group_name  = "rg-hub-eastus"
  virtual_network_name = azurerm_virtual_network.uat_spoke.name
  address_prefixes     = ["10.160.10.0/24"]
  private_endpoint_network_policies = "Enabled"
}



# resource "azurerm_subnet_network_security_group_association" "uat_snet_nsg_association" {
#   subnet_id                 = azurerm_subnet.uat_default_subnet.id
#   network_security_group_id = azurerm_network_security_group.dev_spoke_nsg.id
# }

# resource "azurerm_subnet_route_table_association" "uat_rt_association" {
#   subnet_id      = azurerm_subnet.uat_default_subnet.id
#   route_table_id = azurerm_route_table.uat_rt.id
# }

output "uat_spoke_vnet_id" {
  value = azurerm_virtual_network.uat_spoke.id
}

output "uat_spoke_vnet_name" {
  value = azurerm_virtual_network.uat_spoke.name
}


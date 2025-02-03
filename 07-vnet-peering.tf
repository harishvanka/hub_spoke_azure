##############################
## Hub to Dev Peering
##############################
resource "azurerm_virtual_network_peering" "hub_to_dev_peering" {
  name                      = "HubtoDevSpoke"
  resource_group_name       = "rg-hub-eastus"
  virtual_network_name      = azurerm_virtual_network.hub_vnet.name
  remote_virtual_network_id = azurerm_virtual_network.dev_spoke.id
  depends_on = [ azurerm_virtual_network.hub_vnet, azurerm_virtual_network.dev_spoke ]
}

resource "azurerm_virtual_network_peering" "dev_to_hub_peering" {
  name                      = "DevtoHubSpoke"
  resource_group_name       = "rg-hub-eastus"
  virtual_network_name      = azurerm_virtual_network.dev_spoke.name
  remote_virtual_network_id = azurerm_virtual_network.hub_vnet.id
  depends_on = [ azurerm_virtual_network.hub_vnet, azurerm_virtual_network.dev_spoke ]
}

##############################
## Hub to UAT Peering
##############################
resource "azurerm_virtual_network_peering" "hub_to_uat_peering" {
  name                      = "HubtoUATSpokePeering"
  resource_group_name       = "rg-hub-eastus"
  virtual_network_name      = azurerm_virtual_network.hub_vnet.name
  remote_virtual_network_id = azurerm_virtual_network.uat_spoke.id
  depends_on = [ azurerm_virtual_network.hub_vnet, azurerm_virtual_network.uat_spoke]
}

resource "azurerm_virtual_network_peering" "uat_to_hub_peering" {
  name                      = "HubtoUATSpokePeering"
  resource_group_name       = "rg-hub-eastus"
  virtual_network_name      = azurerm_virtual_network.uat_spoke.name
  remote_virtual_network_id = azurerm_virtual_network.hub_vnet.id
  depends_on = [ azurerm_virtual_network.hub_vnet, azurerm_virtual_network.uat_spoke]
}

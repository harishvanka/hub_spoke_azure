resource "azurerm_network_security_group" "vm_nsg" {
  name                = "Hub-VNet-NSG"
  location            = var.location
  resource_group_name = "rg-hub-eastus"
}

# SSH Rule
resource "azurerm_network_security_rule" "ssh" {
  name                        = "Allow-SSH"
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.vm_nsg.name
  resource_group_name         = "rg-hub-eastus"
}

# RDP Rule
resource "azurerm_network_security_rule" "rdp" {
  name                        = "Allow-RDP"
  priority                    = 1010
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.vm_nsg.name
  resource_group_name         = "rg-hub-eastus"
}

# NSG for Azure Bastion Subnet (HTTPS Only)
resource "azurerm_network_security_group" "bastion_nsg" {
  name                = "Hub-Bastion-NSG"
  location            = "eastus"
  resource_group_name = "rg-hub-eastus"
}

# Bastion Rule (Allow HTTPS for Bastion)
resource "azurerm_network_security_rule" "bastion" {
  name                        = "Allow-Bastion"
  priority                    = 1020
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "Internet"
  destination_address_prefix  = "10.110.80.0/24"
  network_security_group_name = azurerm_network_security_group.bastion_nsg.name
  resource_group_name         = "rg-hub-eastus"
}

# NSG for VPN Gateway Subnet
# resource "azurerm_network_security_group" "vpn_nsg" {
#   name                = "Hub-VPN-NSG"
#   location            = "eastus"
#   resource_group_name = "rg-hub-eastus"
# }

# # Allow VPN Gateway Traffic
# resource "azurerm_network_security_rule" "vpn_gateway" {
#   name                        = "Allow-VPN-GW"
#   priority                    = 1030
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "*"
#   source_port_range           = "*"
#   destination_port_range      = "*"
#   source_address_prefix       = "*"
#   destination_address_prefix  = "10.110.70.0/24"
#   network_security_group_name = azurerm_network_security_group.vpn_nsg.name
#   resource_group_name         = "rg-hub-eastus"
# }

# NSG for Azure Firewall Subnet (Allow All)
# resource "azurerm_network_security_group" "firewall_nsg" {
#   name                = "Hub-Firewall-NSG"
#   location            = "eastus"
#   resource_group_name = "rg-hub-eastus"
# }

# # Allow Azure Firewall Subnet Traffic
# resource "azurerm_network_security_rule" "azure_firewall" {
#   name                        = "Allow-AzureFW"
#   priority                    = 1040
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "*"
#   source_port_range           = "*"
#   destination_port_range      = "*"
#   source_address_prefix       = "*"
#   destination_address_prefix  = "*"
#   network_security_group_name = azurerm_network_security_group.firewall_nsg.name
#   resource_group_name         = "rg-hub-eastus"
# }

# Allow Virtual Network Traffic (VNet Peering)
resource "azurerm_network_security_rule" "allow_vnet" {
  name                        = "Allow-VNET"
  priority                    = 1100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
  network_security_group_name = azurerm_network_security_group.vm_nsg.name
  resource_group_name         = "rg-hub-eastus"
}

# Deny-All Rule (Failsafe)
resource "azurerm_network_security_rule" "deny_all" {
  name                        = "Deny-All"
  priority                    = 4096
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.vm_nsg.name
  resource_group_name         = "rg-hub-eastus"
}

#################
# Association
#################

# Vm Subnet NSG Association
resource "azurerm_subnet_network_security_group_association" "hub_vnet_vm_snet_nsg_association" {
  subnet_id      = azurerm_subnet.hub_vm_subnet.id
  network_security_group_id = azurerm_network_security_group.vm_nsg.id
  depends_on = [ azurerm_network_security_group.vm_nsg ]
}

# # Bastion Subnet NSG Association
# resource "azurerm_subnet_network_security_group_association" "hub_bastion_snet_nsg_association" {
#   subnet_id                 = azurerm_subnet.bastion_subnet.id
#   network_security_group_id = azurerm_network_security_group.bastion_nsg.id
#   depends_on = [ azurerm_network_security_group.bastion_nsg ]
# }



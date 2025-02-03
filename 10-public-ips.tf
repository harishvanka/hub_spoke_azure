# resource "azurerm_public_ip" "bastion_pip" {
#   name                    = local.resource_names.pip_bastion
#   location                = "eastus"
#   resource_group_name     = "Fusion-AppsandServices-UAT"
#   sku                     = "Standard"
#   allocation_method       = "Dynamic"
#   idle_timeout_in_minutes = 4
# #   ip_address              = "20.232.137.63"
# }

# resource "azurerm_public_ip" "pip_hub_firewall" {
#   name                    = local.resource_names.pip_hub_firewall
#   location                = "eastus"
#   resource_group_name     = "Fusion-AppsandServices-UAT"
#   sku                     = "Standard"
#   allocation_method       = "Dynamic"
#   idle_timeout_in_minutes = 4

#   # ip_address = "172.191.111.147" # If you need to specify a static IP
# }

# resource "azurerm_public_ip" "pip_hub_vpn_gateway_eastus_1" {
#   name                    = local.resource_names.pip_hub_vpn_gateway_eastus_1
#   location                = "eastus"
#   resource_group_name     = "Fusion-AppsandServices-UAT"
#   sku                     = "Standard"
#   allocation_method       = "Dynamic"
#   idle_timeout_in_minutes = 4

#   # ip_address = "20.169.214.238" # If you need to specify a static IP
# }

# resource "azurerm_public_ip" "pip_hub_vpn_gateway_eastus_2" {
#   name                    = local.resource_names.pip_hub_vpn_gateway_eastus_2
#   location                = "eastus"
#   resource_group_name     = "Fusion-AppsandServices-UAT"
#   sku                     = "Standard"
#   allocation_method       = "Dynamic"
#   idle_timeout_in_minutes = 4

#   # ip_address = "20.169.215.32" # If you need to specify a static IP
# }


# resource "azurerm_route_table" "dev_rt" {
#   name                = local.resource_names.rt_dev
#   location            = "eastus"
#   resource_group_name = "rg-hub-eastus"
#   tags = {
#     environment = "DEV"
#     createdby   = "Terraform"
#   }
  
# }

# resource "azurerm_route_table" "uat_rt" {
#   name                = local.resource_names.rt_uat
#   location            = "eastus"
#   resource_group_name = "rg-hub-eastus"
#   tags = {
#     environment = "UAT"
#     createdby   = "Terraform"
#   }
# }

# resource "azurerm_route" "rt_dev_firewall" {
#   name                = "RouteTrafficToHubFirewall"
#   resource_group_name = "rg-hub-eastus"
#   route_table_name    = azurerm_route_table.dev_rt.name
#   address_prefix      = "0.0.0.0/0"
#   next_hop_type       = "VirtualAppliance"
#   next_hop_in_ip_address = "10.110.90.4"
#   }

# resource "azurerm_route" "rt_uat_firewall" {
#   name                = "RouteTrafficToHubFirewall"
#   resource_group_name = "rg-hub-eastus"
#   route_table_name    = azurerm_route_table.uat_rt.name
#   address_prefix      = "0.0.0.0/0"
#   next_hop_type       = "VirtualAppliance"
#   next_hop_in_ip_address = "10.110.90.4"
# }


# output "uat_rt_name" {
#   value = azurerm_route_table.uat_rt.name
# }

# output "uat_rt_id" {
#   value = azurerm_route_table.uat_rt.id
# }
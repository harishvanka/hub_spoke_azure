locals {
  resource_names = {
    hub_vnet_name                   = "vnet-hub-spoke-emvptec-eastus"
    dev_spoke_vnet                  = "vnet-dev-spoke-emvptec-eastus"
    qa_spoke_vnet                   = "vnet-qa-spoke-emvptec-eastus"
    uat_spoke_vnet                  = "vnet-uat-spoke-emvptec-eastus"
    staging_spoke_vnet              = "vnet-staging-spoke-emvptec-eastus"
    prod_spoke_vnet                 = "vnet-prod-spoke-emvptec-eastus"
    rt_dev                          = "rt-dev-eastus"
    rt_uat                          = "rt-uat-eastus"
    pip_bastion                     = "pip-bastion-eastus"
    pip_hub_firewall                = "pip-hub-firewall-eastus"
    pip_hub_vpn_gateway_eastus_1    = "pip-hub-vpn-gateway1-eastus"
    pip_hub_vpn_gateway_eastus_2    = "pip-hub-vpn-gateway2-eastus"
  }
}
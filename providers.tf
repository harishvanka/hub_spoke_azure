terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.16.0"
    }
  }
}

provider "azurerm" {
  resource_provider_registrations = "core"
  subscription_id = "xxxxx-xxxx-xxxx-xxxx-xxxxx"
  features {}
}

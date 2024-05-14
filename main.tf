terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.103.1"
    }
  }
}

provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "samacrg" {
   name     = "purpose-rg"
   location = "UK South"
 }

 resource "azurerm_virtual_network" "myvnet" {
   name                = "purpose-vnet"
   address_space       = ["10.0.0.0/16"]
   location            = azurerm_resource_group.samacrg.location
   resource_group_name = azurerm_resource_group.samacrg.name
 }
resource "azurerm_subnet" "samacrgsubnet" {
   name                 = "purpose-sub"
   resource_group_name  = azurerm_resource_group.samacrg.name
   virtual_network_name = azurerm_virtual_network.samacvnet.name
   address_prefixes     = ["10.0.2.0/24"]
 }

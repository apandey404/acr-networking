resource "azurerm_resource_group" "rg" {
  name     = "rg-demo-vnet"
  location = "westeurope"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-spoke"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet-frontend-servers" {
  name                 = "subnet-frontend-servers"
  resource_group_name  = azurerm_virtual_network.vnet.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_subnet" "subnet-backend-servers" {
  name                 = "subnet-backend-servers"
  resource_group_name  = azurerm_virtual_network.vnet.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

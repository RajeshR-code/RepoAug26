resource "azurerm_resource_group" "rgs" {
  name     = "rg-one"
  location = "Central India"
}

resource "azurerm_network_security_group" "vnet" {
  name                = "rr-vnet"
  location            = "Central India"
  resource_group_name = "rg-one"
}
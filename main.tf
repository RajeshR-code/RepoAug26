resource "azurerm_resource_group" "rgs" {
  name     = "rg-one"
  location = "Central India"
}

resource "azurerm_resource_group" "rgs" {
  name     = "rg-two"
  location = "Central Australia"
}

resource "azurerm_network_security_group" "vnet" {
  name                = "rr-vnet"
  location            = "Central India"
  resource_group_name = "rg-one"
}

resource "azurerm_subnet" "subnets" {
  name                 = "rr-subnet"
  resource_group_name  = "rr-rg"
  virtual_network_name = "rr-vnet"
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "nic" {
  name                = "rr-nic"
  location            = "central India"
  resource_group_name = "rg-one"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}
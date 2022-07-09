
resource "azurerm_virtual_network" "terraform" {
  name                = "mainnetwork"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.terraform.location
  resource_group_name = azurerm_resource_group.terraform.name
}

resource "azurerm_subnet" "terraform" {
  name                 = "subnetnew"
  resource_group_name  = azurerm_resource_group.terraform.name
  virtual_network_name = azurerm_virtual_network.terraform.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "terraform" {
  name                = "azurenetworkinterface"
  location            = azurerm_resource_group.terraform.location
  resource_group_name = azurerm_resource_group.terraform.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.terraform.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.terraform.id
  }
}

resource "azurerm_public_ip" "terraform" {
  name                = "azurepublicipaddress"
  resource_group_name = azurerm_resource_group.terraform.name
  location            = azurerm_resource_group.terraform.location
  allocation_method   = "Static"
}
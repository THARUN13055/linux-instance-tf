
resource "azurerm_linux_virtual_machine" "terraform" {
  name                = "tharun123"
  resource_group_name = azurerm_resource_group.terraform.name
  location            = azurerm_resource_group.terraform.location
  size                = "Standard_F2"
  admin_username      = "tharun"
  network_interface_ids = [
    azurerm_network_interface.terraform.id,
  ]

  admin_ssh_key {
    username   = "tharun"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}

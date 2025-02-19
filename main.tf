data "azurerm_resource_group" "example" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "example" {
  name                = var.virtual_networkname
  address_space       = ["10.0.0.0/16"]
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name
}

resource "azurerm_subnet" "example" {
  name                 = var.subnetname
  resource_group_name  = data.azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}
resource "azurerm_public_ip" "example" {
  name                = var.publicip
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name
  allocation_method   = "Static"  # Change this to Static
  sku                 = "Standard"  # Ensure the SKU is set to Standard
}
resource "azurerm_network_interface" "example" {
  name                = var.nicname
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.example.id
  
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  name                = var.vmname
  resource_group_name = data.azurerm_resource_group.example.name
  location            = data.azurerm_resource_group.example.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  admin_password      = var.vm_pass
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
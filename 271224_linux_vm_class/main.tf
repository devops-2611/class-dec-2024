variable "vms" {}

resource "azurerm_resource_group" "rg-block" {
  name     = var.vms.rgname      #"welcome-rg1"
  location = var.vms.rg-location # canada central
}
resource "azurerm_virtual_network" "vnet-block" {
  depends_on          = [azurerm_resource_group.rg-block]
  name                = var.vms.vnet-name
  address_space       = var.vms.address_space
  location            = var.vms.rg-location
  resource_group_name = var.vms.rgname
}
resource "azurerm_subnet" "subnet-block-new" {
  depends_on           = [azurerm_virtual_network.vnet-block]
  name                 = var.vms.subnet-name
  resource_group_name  = var.vms.rgname
  virtual_network_name = var.vms.vnet-name
  address_prefixes     = var.vms.address-prefix
}
resource "azurerm_network_interface" "nic-block" {
  depends_on          = [azurerm_subnet.subnet-block-new]
  name                = var.vms.nic-name
  location            = var.vms.rg-location
  resource_group_name = var.vms.rgname

  ip_configuration {
    name                          = var.vms.ip-name
    subnet_id                     = azurerm_subnet.subnet-block-new.id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_linux_virtual_machine" "vm-blcok" {
  depends_on = [azurerm_network_interface.nic-block]

  name                = var.vms.vm-name
  resource_group_name = var.vms.rgname
  location            = var.vms.rg-location
  size                = var.vms.vm-size
  admin_username      = var.vms.vm-username
  admin_password      = var.vms.vm-password
  network_interface_ids = [azurerm_network_interface.nic-block.id ]
  disable_password_authentication = false


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















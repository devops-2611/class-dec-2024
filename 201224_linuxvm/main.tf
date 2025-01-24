variable "vms" {}
resource "azurerm_resource_group" "rgwel" {
  name     = var.vms.vm01.rgname
  location = var.vms.vm01.location
}
resource "azurerm_virtual_network" "vnwel" {
  #for_each            = var.vms
  name                = var.vms.vm01.vnname
  location            = var.vms.vm01.location
  resource_group_name = var.vms.vm01.rgname
  address_space       = var.vms.vm01.address_space
  depends_on          = [azurerm_resource_group.rgwel]
}
resource "azurerm_subnet" "snwel" {
  #for_each             = var.vms
  name                 = var.vms.vm01.snname
  resource_group_name  = var.vms.vm01.rgname
  virtual_network_name = var.vms.vm01.vnname
  address_prefixes     = var.vms.vm01.address_prefixes
  depends_on           = [azurerm_virtual_network.vnwel]
}
resource "azurerm_public_ip" "piwel" {
  #for_each            = var.vms
  name                = var.vms.vm01.piname
  resource_group_name = var.vms.vm01.rgname
  location            = var.vms.vm01.location
  allocation_method   = var.vms.vm01.allocation_method
  depends_on          = [azurerm_subnet.snwel]
}
resource "azurerm_network_interface" "niwel" {
  #for_each            = var.vms
  name                = var.vms.vm01.niname
  resource_group_name = var.vms.vm01.rgname
  location            = var.vms.vm01.location
  depends_on          = [azurerm_public_ip.piwel]
  ip_configuration {
    name                          = var.vms.vm01.ipcname
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.piwel.id
    subnet_id                     = azurerm_subnet.snwel.id

  }
}


resource "azurerm_network_security_group" "nsgwel" {
  #for_each            = var.vms
  name                = "nsg_welcome"
  location            = var.vms.vm01.location
  resource_group_name = var.vms.vm01.rgname
  depends_on          = [azurerm_resource_group.rgwel]
}



resource "azurerm_network_security_rule" "http_3000_rule_vm01" {

  count                       = var.vms["vm01"] != null ? 1 : 0
  name                        = "allow-http-3000-vm01"
  priority                    = 103
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.vms.vm01.rgname
  network_security_group_name = azurerm_network_security_group.nsgwel.name
}


# Associate NSG with NIC using #for_each
resource "azurerm_network_interface_security_group_association" "nsg_association" {
  #for_each                  = var.vms
  network_interface_id      = azurerm_network_interface.niwel.id
  network_security_group_id = azurerm_network_security_group.nsgwel.id
  depends_on                = [azurerm_resource_group.rgwel]
}



resource "azurerm_linux_virtual_machine" "vmwel" {
  #for_each                        = var.vms
  name                            = var.vms.vm01.vmname
  resource_group_name             = var.vms.vm01.rgname
  location                        = var.vms.vm01.location
  size                            = var.vms.vm01.size
  disable_password_authentication = false
  admin_username                  = "welcomeuser"
  admin_password                  = "welcome@12345"
  network_interface_ids           = [azurerm_network_interface.niwel.id]
  depends_on                      = [azurerm_network_interface.niwel]

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



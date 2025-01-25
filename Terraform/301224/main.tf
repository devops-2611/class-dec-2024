variable "vm01" {
}

resource "azurerm_resource_group" "rg-block" {
  name     = var.vm01.rg-name
  location = var.vm01.rg-location
}
resource "azurerm_virtual_network" "vnet-block" {
  depends_on          = [azurerm_resource_group.rg-block]
  name                = var.vm01.vnet-name
  address_space       = var.vm01.vnet-cidr
  location            = var.vm01.rg-location
  resource_group_name = var.vm01.rg-name
}

resource "azurerm_subnet" "subnet-block" {
  depends_on           = [azurerm_virtual_network.vnet-block]
  name                 = var.vm01.subnet-name
  resource_group_name  = var.vm01.rg-name
  virtual_network_name = var.vm01.vnet-name
  address_prefixes     = var.vm01.subent-cidr
}

resource "azurerm_public_ip" "pip-block" {
  depends_on          = [azurerm_resource_group.rg-block]
  name                = var.vm01.public-ip-name
  resource_group_name = var.vm01.rg-name
  location            = var.vm01.rg-location
  allocation_method   = var.vm01.allocation-method

}

resource "azurerm_network_interface" "ni-block" {
  depends_on          = [azurerm_subnet.subnet-block]
  name                = var.vm01.ni-name
  location            = var.vm01.rg-location
  resource_group_name = var.vm01.rg-name

  ip_configuration {
    name                          = var.vm01.ip-name
    subnet_id                     = azurerm_subnet.subnet-block.id
    private_ip_address_allocation = var.vm01.ip-type
    public_ip_address_id          = azurerm_public_ip.pip-block.id
  }
}

resource "azurerm_linux_virtual_machine" "vm-blcok" {
  depends_on = [azurerm_network_interface.ni-block]

  name                            = var.vm01.vm-name
  resource_group_name             = var.vm01.rg-name
  location                        = var.vm01.rg-location
  size                            = var.vm01.vm-size
  admin_username                  = var.vm01.admin_username
  admin_password                  = var.vm01.admin_password
  network_interface_ids           = [azurerm_network_interface.ni-block.id]
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


#data block

# data "azurerm_key_vault" "keyvault-block" {
#   name                = "welcome-keyvault4"
#   resource_group_name = "queen-rg"
# }

# data "azurerm_key_vault_secret" "secret-block" {
#   name         = "username"
#   key_vault_id = data.azurerm_key_vault.keyvault-block.id
# }

# data "azurerm_key_vault_secret" "secret-block1" {
#   name         = "password"
#   key_vault_id = data.azurerm_key_vault.keyvault-block.id
# }



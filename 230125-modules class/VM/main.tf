variable "varvm" {}
variable "vardatani" {}


resource "azurerm_linux_virtual_machine" "vm-blcok" {
  for_each   = var.varvm
  name                            = each.value.vm-name
  resource_group_name             = each.value.rg-name
  location                        = each.value.rg-location
  size                            = each.value.vm-size
  admin_username                  = each.value.username
  admin_password                  = each.value.password
  network_interface_ids           = [data.azurerm_network_interface.data-ni[each.key].id]
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

data "azurerm_network_interface" "data-ni" {
  for_each = var.vardatani # varenvni
  name                = each.value.ni-name # welni01
  resource_group_name = each.value.rg-name # welrg01
}
variable "varnsgni" {}


data "azurerm_network_security_group" "data-nsg" {
  for_each = var.varnsgni
  name                = each.value.nsg-name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_network_interface" "data-ni" {
  for_each = var.varnsgni
  name                = each.value.ni-name
  resource_group_name = each.value.resource_group_name
}


resource "azurerm_network_interface_security_group_association" "nsg_association" {
  for_each = var.varnsgni
  network_interface_id      = data.azurerm_network_interface.data-ni[each.key].id
  network_security_group_id = data.azurerm_network_security_group.data-nsg[each.key].id
}
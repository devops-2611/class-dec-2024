variable "varsn" {}

resource "azurerm_subnet" "subnet-block" {
  for_each             = var.varsn
  name                 = each.value.subnet-name
  resource_group_name  = each.value.rg-name
  virtual_network_name = each.value.vnet-name
  address_prefixes     = each.value.address_prefixes
}
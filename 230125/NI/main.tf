variable "varni" {}
variable "vardatasi" {}
variable "vardatapi" {}

data "azurerm_subnet" "data-snet" {
  for_each = var.vardatasi
  name                 = each.value.subnet-name
  virtual_network_name = each.value.vnet-name
  resource_group_name  = each.value.rg-name
}

data "azurerm_public_ip" "data-pip" {
  for_each = var.vardatapi
  name                = each.value.public-ip-name
  resource_group_name = each.value.rg-name
}



resource "azurerm_network_interface" "ni-block" {
  for_each            = var.varni
  name                = each.value.ni-name
  location            = each.value.rg-location
  resource_group_name = each.value.rg-name

  ip_configuration {
    name                          = each.value.ip-name
    subnet_id                     = data.azurerm_subnet.data-snet[each.key].id
    private_ip_address_allocation = each.value.ip-type
    public_ip_address_id          = data.azurerm_public_ip.data-pip[each.key].id
  }
}
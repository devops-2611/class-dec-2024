variable "varni" {}
variable "vardatasi" {}
variable "vardatapi" {}

resource "azurerm_network_interface" "ni-block" {
  for_each            = var.varni # varenvni
  name                = each.value.ni-name # ni01
  location            = each.value.rg-location
  resource_group_name = each.value.rg-name

  ip_configuration {
    name                          = each.value.ip-name
    subnet_id                     = data.azurerm_subnet.data-snet[each.key].id # ni01
    private_ip_address_allocation = each.value.ip-type
    public_ip_address_id          = data.azurerm_public_ip.data-pip[each.key].id
  }
}





data "azurerm_subnet" "data-snet" {
  for_each = var.vardatasi # varenvsn sn01
  name                 = each.value.subnet-name # welsn01 welsn02
  virtual_network_name = each.value.vnet-name # welvn01 welvn02
  resource_group_name  = each.value.rg-name # welrg01 welrg02
}

data "azurerm_public_ip" "data-pip" {
  for_each = var.vardatapi # varenvpi
  name                = each.value.public-ip-name # welpip01 # 
  resource_group_name = each.value.rg-name # welrg01
}

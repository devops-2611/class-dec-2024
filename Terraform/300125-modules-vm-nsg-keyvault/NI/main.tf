variable "varni" {}
variable "vardatapi" {}
variable "vardatasi" {}

data "azurerm_public_ip" "data-pi" {
    for_each = var.vardatapi
    name                = each.value.name
    resource_group_name = each.value.resource_group_name
}
data "azurerm_subnet" "data-sn" {
    for_each = var.vardatasi
    name = each.value.name
    virtual_network_name = each.value.virtual_network_name
    resource_group_name = each.value.resource_group_name
}

resource "azurerm_network_interface" "ni-block" {
    for_each = var.varni
    name=each.value.name
    resource_group_name = each.value.resource_group_name
    location = each.value.location
    ip_configuration {
      name = each.value.name
      private_ip_address_allocation = each.value.private_ip_address_allocation
      public_ip_address_id = data.azurerm_public_ip.data-pi[each.value.public].id
      subnet_id = data.azurerm_subnet.data-sn[each.value.subnet].id

    }
  
}


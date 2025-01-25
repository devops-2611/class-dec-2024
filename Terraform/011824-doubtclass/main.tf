variable "ana" {}

resource "azurerm_resource_group" "rg-block" {
    for_each = var.ana   
    name = each.value.rg-name  # welcome-rg1  #welcome-rg2
    location = each.value.rg-location # west us #east us
  
}

resource "azurerm_virtual_network" "vnet-block" {
    for_each = var.ana
    depends_on = [ azurerm_resource_group.rg-block ]
    name = each.value.vnet-name
    address_space= each.value.address-space
    resource_group_name= each.value.rg-name
    location = each.value.rg-location
  
}
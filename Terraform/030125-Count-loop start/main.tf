variable "rg-var" {}

resource "azurerm_resource_group" "rg-block1" {
  for_each = var.rg-var
  name     =each.value.rg-name
  location = "West Europe"
}

resource "azurerm_storage_account" "storage-block" {
  depends_on = [ azurerm_resource_group.rg-block1 ]
  for_each = var.rg-var
  name                     = each.value.storage-name
  resource_group_name      = each.value.rg-name
  location                 = "west us"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}


















# resource "azurerm_resource_group" "rg-block1" {
#   for_each = var.rg-var
#   name     = each.value
#   location = "West Europe"
# }












# variable "rg-var" {
# }

# resource "azurerm_resource_group" "rg-block1" {
#   for_each = var.rg-var
#   name     = each.key
#   location = "West Europe"
# }














# variable "rg-var" {
# }

# resource "azurerm_resource_group" "rg-block1" {
#   for_each = var.rg-var
#   name     = each.value.rg-name
#   location = "West Europe"
# }














# variable "vm01" {
#   default = "welcome" 
# }


# resource "azurerm_resource_group" "rg-block" {
#   name     = "${var.vm01}-rg" 
#   location = "West Europe"
# }


# resource "azurerm_virtual_network" "ananya-vnet2" {
#   depends_on          =[azurerm_resource_group.rg-block]
#   name                = "${var.vm01}-vnet"
#   address_space       = ["10.0.0.0/16"]
#   location            = "West Europe"
#   resource_group_name = "${var.vm01}-rg"
# }




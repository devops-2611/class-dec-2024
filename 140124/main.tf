resource "azurerm_resource_group" "rg-block" {
  name     = "${2==2}-rg"
  location = "east us"
}










# variable "rg-name" {}
# variable "rg-loc" {}
# variable "stor-var" {
  
# }


# resource "azurerm_resource_group" "rg-block" {
#   name     = var.rg-name
#   location = var.rg-loc
# }

# resource "azurerm_storage_account" "storage-block" {
#   for_each = var.stor-var
#   depends_on = [ azurerm_resource_group.rg-block ]
#   name                     =each.value.storage-name
#   resource_group_name      =var.rg-name
#   location                 = var.rg-loc
#   account_tier             = "Standard"
#   account_replication_type = "GRS"
# }

















# # resource "azurerm_resource_group" "rg-block" {
# #     for_each = var.common-var
# #     name= each.key
# #     location = "east us"
# # }











# # resource "azurerm_resource_group" "rg-block" {
# #     for_each = var.common-var
# #     name= each.value
# #     location = "east us"
  
# # }









# # for_each= 
# #     name1 = "Akshay-rg"
# #     name2= "Kriti-rg"
# #     name3="Ananya-rg"

# # resource "azurerm_resource_group" "rg-block" {
# #     count =  2
# #     name = "welcome-${count.idex}"
# #     location = "east us"
  
# # }




















# # variable "create-rg" {
# #   type = bool
# # }
# # resource "azurerm_resource_group" "dodo-rg" {
# #   count = var.create-rg ? 1 : 0
# #   name = "welcome-rg-${count.index + 1}"
# #   location = "central India"  
# # }




# # variable "rg-var" {}



# # resource "azurerm_resource_group" "rg-block" {
# #   name     = "sharma-${var.rg-var}"
# #   location = "West US"

# # }




# # resource "azurerm_resource_group" "wel-rg" {
# #   count = 5
# #   name = "welecome-rg-${count.index + 2}"
# #   location = "central India"  
# # }

# # variable "var-rg" {}

# # resource "azurerm_resource_group" "welcome-rg" {
# #     for_each = var.var-rg

# #   name = each.key
# #   location = "central India"
  
# # }



# # resource "azurerm_resource_group" "welcome-rg" {
# #   for_each = {
# #     welcomerg1= "rg-welcome-1"
# #     welcomerg2= "rg-welcome-2" 
# #   }
# #   name = each.key
# #   location = "central India"
  
# # }
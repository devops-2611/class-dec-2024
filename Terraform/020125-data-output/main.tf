resource "azurerm_virtual_network" "vnet-block" {
  for_each = var.vnet-var
  name                = each.value.vnet-name
  address_space       = each.value.address-space
  location            = "Central India"
  resource_group_name = "welcome-rg"
}
variable "vnet-var" {}







# resource "azurerm_virtual_network" "vnet-block" {
#   name                = "welcome-vnet2"
#   address_space       = ["10.0.0.0/16"]
#   location            = "Central India"
#   resource_group_name = "welcome-rg"
# }










# data "azurerm_public_ip" "welcome-ip" {
#   name                = "welcomeip"
#   resource_group_name = "welcome-rg"
# }

# output "public_ip_id" {
#   value = data.azurerm_public_ip.welcome-ip.id
# }

# output "public_ip_address" {
#   value = data.azurerm_public_ip.welcome-ip.ip_address
# }





# data "azurerm_resource_group" "rg-block" {
# #   name = "welcome-rg"
# }

# output "id" {
#   value = data.azurerm_resource_group.rg-block.id
# }


# data "azurerm_subnet" "subnet-block" {
#   name                 = "welcomesn"
#   virtual_network_name = "welcomevn"
#   resource_group_name  = "welcome-rg"
# }

# output "subnet_id" {
#   value = data.azurerm_subnet.subnet-block.id
# }




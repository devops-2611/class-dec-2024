resource "azurerm_resource_group" "rgdodo" {
for_each = var.varrg
name = each.value.name
location = each.value.location
}
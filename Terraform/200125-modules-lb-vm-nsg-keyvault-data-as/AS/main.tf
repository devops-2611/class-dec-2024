variable "varas" {
  
}
resource "azurerm_availability_set" "avset" {
  for_each = var.varas
  name                         = each.value.name
  location                     = each.value.location
  resource_group_name          = each.value.resource_group_name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 2
  managed                      = true
}




# resource "azurerm_availability_set" "avset" {
#   name                         = "server-as"
#   location                     = "west us"
#   resource_group_name          = "server-rg"
#   platform_fault_domain_count  = 2
#   platform_update_domain_count = 2
#   managed                      = true
# }
resource "azurerm_resource_group" "rg-block" {
    name = "welcome-rg6"
    location = "east us"  
}

output "rg-id" {
  value = azurerm_resource_group.rg-block.id
}



# data block


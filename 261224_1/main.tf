variable "wel-var" {}


resource "azurerm_resource_group" "rg-block" {
  name     = var.wel-var.name-rg
  location = var.wel-var.location-rg
}


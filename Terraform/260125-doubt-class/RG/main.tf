variable "varrg" {}

resource "azurerm_resource_group" "example" {
  for_each = var.varrg  # vaenvrrg
  name     = each.value.name
  location = each.value.location
}


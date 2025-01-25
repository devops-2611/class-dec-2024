variable "varrg" {}
# varrnvrg
resource "azurerm_resource_group" "rg-block" {
  for_each = var.varrg  # varenvrg
  name     = each.value.rg-name
  location = each.value.rg-location
}


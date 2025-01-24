

resource "azurerm_storage_account" "sa-block" {
  for_each =   var.varsa
  name                     = each.value.sa-name
  resource_group_name      = each.value.rg-name
  location                 = each.value.rg-location
  account_tier             = "Standard"
  account_replication_type = "GRS"

}
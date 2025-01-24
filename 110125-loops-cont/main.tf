variable "common-var" {
}






resource "azurerm_resource_group" "rg-block" {
  for_each = var.common-var
  name     = each.value.rg-name
  location = each.value.rg-location
}

resource "azurerm_storage_account" "storage-block" {
  depends_on = [ azurerm_resource_group.rg-block ]
  for_each = var.common-var
  name                     = each.value.storage-name
  resource_group_name      = each.value.rg-name
  location                 = "west us"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "cont-block" {
  depends_on = [ azurerm_storage_account.storage-block ]
  for_each = var.common-var
  name                  = each.value.cont-name
  storage_account_id    = azurerm_storage_account.storage-block[each.key].id
  container_access_type = "private"
}


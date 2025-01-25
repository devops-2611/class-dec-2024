variable "wel-variable" {}

resource "azurerm_resource_group" "rg-block" {
  name     = var.wel-variable.resource-name
  location = var.wel-variable.resource-location
}

resource "azurerm_storage_account" "storage-block" {
    depends_on = [ azurerm_resource_group.rg-block ]
    name= var.wel-variable.storage-name
    resource_group_name = var.wel-variable.resource-name
    location = var.wel-variable.resource-location
    account_tier=var.wel-variable.account-tier
    account_replication_type=var.wel-variable.account_replication_type
  
}

resource "azurerm_storage_container" "example" {
  depends_on = [ azurerm_storage_account.storage-block ]
  name = var.wel-variable.container-name
  storage_account_id    = azurerm_storage_account.storage-block.id
  container_access_type = var.wel-variable.container_access_type
}

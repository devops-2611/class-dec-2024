resource "azurerm_resource_group" "rg-block" {
  name     = "welcome-rg4"
  location = "West Europe"
}


resource "azurerm_storage_account" "storage-block" {
  depends_on = [ azurerm_resource_group.rg-block ]
  name                     = "welcomestorage13"  
  resource_group_name      = "welcome-rg4" 
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "cont-block" {
  depends_on = [ azurerm_storage_account.storage-block ]
  name                  = "welcome-container1"
  storage_account_id    = azurerm_storage_account.storage-block.id
  container_access_type = "private"
}
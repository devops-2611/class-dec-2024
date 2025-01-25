data "azurerm_client_config" "welcome" {}

resource "azurerm_resource_group" "rg-block" {
  name     = "keyvault-rg-test1"
  location = "West Europe"
}

resource "azurerm_key_vault" "kv-block" {
  name                       = "keyvaulttest123987jhj1"
  location                   = azurerm_resource_group.rg-block.location
  resource_group_name        = azurerm_resource_group.rg-block.name
  tenant_id                  = data.azurerm_client_config.welcome.tenant_id
  sku_name                   = "premium"
  soft_delete_retention_days = 7

  access_policy {
    tenant_id = data.azurerm_client_config.welcome.tenant_id
    object_id = data.azurerm_client_config.welcome.object_id

    key_permissions = [
      "Create",
      "Get",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover",
      "List"
    ]
  }
}

resource "azurerm_key_vault_secret" "secret-block" {
  name         = "username121"
  value        = "welcomeuser"
  key_vault_id = azurerm_key_vault.kv-block.id
}
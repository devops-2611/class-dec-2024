data "azurerm_client_config" "welcome" {}

variable "varkv" {}


resource "azurerm_key_vault" "kv-block" {
  for_each = var.varkv
  name                       = each.value.name
  location                   = each.value.location
  resource_group_name        = each.value.resource_group_name
  tenant_id                  = data.azurerm_client_config.welcome.tenant_id
  sku_name                   = each.value.sku_name
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

variable "varksu" {}
variable "varksp" {}

resource "azurerm_key_vault_secret" "usecret-block" {
  depends_on = [ azurerm_key_vault.kv-block ]
  for_each = var.varksu
  name         = each.value.name
  value        = each.value.value1
  key_vault_id = azurerm_key_vault.kv-block[each.value.kv].id
}

resource "azurerm_key_vault_secret" "psecret-block" {
  depends_on = [ azurerm_key_vault.kv-block ]
  for_each = var.varksp
  name         = each.value.name
  value        = each.value.value1
  key_vault_id = azurerm_key_vault.kv-block[each.value.kv].id
}



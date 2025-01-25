data "azurerm_network_interface" "nidata1" {
    for_each = var.vardatanic
    name=each.value.name
    resource_group_name = each.value.resource_group_name
}


data "azurerm_key_vault" "kvdata1" {
    
    name="kvtd01"
    resource_group_name = "rgpd01"
}

data "azurerm_key_vault_secret" "kv1userdata" {
    name="username"  #dodouser
    key_vault_id=data.azurerm_key_vault.kvdata1.id
}

data "azurerm_key_vault_secret" "kv1passdata" {
    name="password" #dodopassword@12345
    key_vault_id=data.azurerm_key_vault.kvdata1.id
}
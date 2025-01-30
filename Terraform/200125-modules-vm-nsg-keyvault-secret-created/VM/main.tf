variable "varvm" {}
variable "vardatanic" {}
variable "varkv" {}
variable "varksu" {}
variable "varksp" {}

data "azurerm_network_interface" "nidata1" {
    for_each = var.vardatanic
    name=each.value.name
    resource_group_name = each.value.resource_group_name
}


data "azurerm_key_vault" "kvdata1" {
    for_each = var.varkv    
    name = each.value.name
    resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "kv1userdata" {
    for_each = var.varksu  
    name= each.value.name  #welcomeuser
    key_vault_id=data.azurerm_key_vault.kvdata1[each.value.kv].id
}

data "azurerm_key_vault_secret" "kv1passdata" {
    for_each = var.varksp
    name=each.value.name #welcome@12345
    key_vault_id=data.azurerm_key_vault.kvdata1[each.value.kv].id
}

resource "azurerm_linux_virtual_machine" "vmdodo" {
    for_each = var.varvm
    name=each.value.name
    resource_group_name = each.value.resource_group_name
    location = each.value.location
    size = each.value.size
    disable_password_authentication=false
    admin_username = data.azurerm_key_vault_secret.kv1userdata[each.value.ku].value
    admin_password = data.azurerm_key_vault_secret.kv1passdata[each.value.kp].value
    network_interface_ids = [data.azurerm_network_interface.nidata1[each.value.ni].id]
    
    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }
    source_image_reference {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
    }
}

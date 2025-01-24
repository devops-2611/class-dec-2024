resource "azurerm_linux_virtual_machine" "vmdodo" {
    for_each = var.varvm
    name=each.value.name
    resource_group_name = each.value.resource_group_name
    location = each.value.location
    size = each.value.size
    disable_password_authentication=false
    admin_username = data.azurerm_key_vault_secret.kv1userdata.value
    admin_password = data.azurerm_key_vault_secret.kv1passdata.value
    network_interface_ids = [data.azurerm_network_interface.nidata1[each.key].id]
    
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

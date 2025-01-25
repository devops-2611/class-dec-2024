data "azurerm_public_ip" "pidata1" {
    for_each = var.vardatapi
    name                = each.value.name
    resource_group_name = each.value.resource_group_name
}

data "azurerm_subnet" "sndata1" {
    for_each = var.vardatasi
    name = each.value.name
    virtual_network_name = each.value.virtual_network_name
    resource_group_name = each.value.resource_group_name


}


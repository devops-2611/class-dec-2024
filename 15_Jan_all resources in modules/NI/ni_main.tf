resource "azurerm_network_interface" "nidodo" {
    for_each = var.varni
    name=each.value.name
    resource_group_name = each.value.resource_group_name
    location = each.value.location
    ip_configuration {
      name = each.value.ip_configuration.name
      private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
      public_ip_address_id = data.azurerm_public_ip.pidata1[each.key].id
      subnet_id = data.azurerm_subnet.sndata1[each.key].id

    }
  
}
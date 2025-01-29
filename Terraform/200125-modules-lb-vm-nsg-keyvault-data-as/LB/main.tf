variable "varlb" {}


resource "azurerm_public_ip" "pip-block" {
    # for_each = var.var.varlb
  name                = var.varlb["lb01"].pip-name
  location            = var.varlb["lb01"].location
  resource_group_name = var.varlb["lb01"].resource_group_name
  allocation_method   = "Static"
}



resource "azurerm_lb" "lb-block" {
    # for_each = var.var.varlb
  name                = var.varlb["lb01"].name
  location            = var.varlb["lb01"].location
  resource_group_name = var.varlb["lb01"].resource_group_name

  frontend_ip_configuration {
    name                 = var.varlb["lb01"].fip-name
    public_ip_address_id = azurerm_public_ip.pip-block.id
  }
}

resource "azurerm_lb_backend_address_pool" "bp-block" {
    # for_each = var.varlb
  loadbalancer_id = azurerm_lb.lb-block.id
  name            = var.varlb["lb01"].be-pool
}

variable "varhp" {}



resource "azurerm_lb_probe" "hp" {
    for_each = var.varhp
    depends_on = [ azurerm_lb.lb-block ]
  name                              = each.value.name
#   resource_group_name               = var.varlb["lb01"].resource_group_name
  loadbalancer_id                   = azurerm_lb.lb-block.id
  protocol                          = "Tcp"
  port                              = each.value.port
  interval_in_seconds               = 5
  number_of_probes                  = 2
}



resource "azurerm_lb_rule" "rule1" {
    depends_on = [ azurerm_lb.lb-block, azurerm_lb_probe.hp ]
    for_each = var.varhp
  name                            = each.value.rule-name
  loadbalancer_id                 = azurerm_lb.lb-block.id
  frontend_ip_configuration_name = each.value.fip-name
#   backend_address_pool_id        = azurerm_lb_backend_address_pool.bp-block.id
  probe_id                        = azurerm_lb_probe.hp[each.key].id
  protocol                        = "Tcp"
  frontend_port                   = each.value.frontend_port
  backend_port                    = each.value.frontend_port
}


# resource "azurerm_lb_backend_address_pool_association" "vm1_association" {
#   backend_address_pool_id = azurerm_lb_backend_address_pool.bp-block.id
#   network_interface_id    = azurerm_network_interface.welcome-ni1.id
# }

# resource "azurerm_lb_backend_address_pool_association" "vm2_association" {
#   backend_address_pool_id = azurerm_lb_backend_address_pool.bp-block.id
#   network_interface_id    = azurerm_network_interface.welcome-ni1.id
# }
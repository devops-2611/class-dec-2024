
# Resource Group
resource "azurerm_resource_group" "server_rg01" {
  name     = "server-rg01"
  location = "east us"
}

# Public IP
resource "azurerm_public_ip" "pip01" {
  name                = "pip01"
  location            = azurerm_resource_group.server_rg01.location
  resource_group_name = azurerm_resource_group.server_rg01.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

# Load Balancer
resource "azurerm_lb" "lb01" {
  name                = "lb01"
  location            = azurerm_resource_group.server_rg01.location
  resource_group_name = azurerm_resource_group.server_rg01.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "fip01"
    public_ip_address_id = azurerm_public_ip.pip01.id
  }
}

# Backend Address Pool
resource "azurerm_lb_backend_address_pool" "pool1" {
  loadbalancer_id = azurerm_lb.lb01.id
  name            = "pool1"
}

# Health Probes
resource "azurerm_lb_probe" "hp01" {
  loadbalancer_id = azurerm_lb.lb01.id
  name            = "hp01"
  port            = 22
  protocol        = "Tcp"
  interval_in_seconds = 5
  number_of_probes = 1
}

resource "azurerm_lb_probe" "hp02" {
  loadbalancer_id = azurerm_lb.lb01.id
  name            = "hp02"
  port            = 80
  protocol        = "Tcp"
  interval_in_seconds = 5
  number_of_probes = 1
}

# Load Balancing Rules
resource "azurerm_lb_rule" "rule01" {
  loadbalancer_id                = azurerm_lb.lb01.id
  name                           = "rule01"
  protocol                       = "Tcp"
  frontend_port                  = 22
  backend_port                   = 22
  frontend_ip_configuration_name = "fip01"
#   backend_address_pool_id        = azurerm_lb_backend_address_pool.pool1.id
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.pool1.id]
    
  probe_id                       = azurerm_lb_probe.hp01.id
}

resource "azurerm_lb_rule" "rule02" {
  loadbalancer_id                = azurerm_lb.lb01.id
  name                           = "rule02"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "fip01"
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.pool1.id]
  probe_id                       = azurerm_lb_probe.hp02.id
}

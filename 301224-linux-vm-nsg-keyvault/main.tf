# variable "vm01" {
#   type = object({
#     rg-name           = string
#     rg-location       = string
#     vnet-name         = string
#     vnet-cidr         = list(string)
#     subnet-name       = string
#     subnet-cidr       = list(string)
#     public-ip-name    = string
#     allocation-method = string
#     ni-name           = string
#     ip-name           = string
#     ip-type           = string
#     vm-name           = string
#     vm-size           = string
#     nsg-name          = string
#   })
# }

variable "vm01" {}

#data block: use to take the inputs of existing resources

data "azurerm_key_vault" "welcome-kv" {
  name                = var.vm01.key-vault-name #welcome-key-vault1
  resource_group_name = var.vm01.key-vault-rg-name # key-vault-rg
}
data "azurerm_key_vault_secret" "welcome-user" {
  name         = var.vm01.secret-username #admin-username
  key_vault_id = data.azurerm_key_vault.welcome-kv.id
}

# data.azurerm_key_vault_secret.welcome-user.value

data "azurerm_key_vault_secret" "welcome-pass" {
  name         = var.vm01.secret-password
  key_vault_id = data.azurerm_key_vault.welcome-kv.id
}


resource "azurerm_resource_group" "rg-block" {
  name     = var.vm01.rg-name
  location = var.vm01.rg-location
}
resource "azurerm_virtual_network" "vnet-block" {
  depends_on          = [azurerm_resource_group.rg-block]
  name                = var.vm01.vnet-name
  address_space       = var.vm01.vnet-cidr
  location            = var.vm01.rg-location
  resource_group_name = var.vm01.rg-name
}
resource "azurerm_subnet" "subnet-block" {
  depends_on           = [azurerm_virtual_network.vnet-block]
  name                 = var.vm01.subnet-name
  resource_group_name  = var.vm01.rg-name
  virtual_network_name = var.vm01.vnet-name
  address_prefixes     = var.vm01.subnet-cidr
}
resource "azurerm_public_ip" "pip-block" {
  depends_on          = [azurerm_resource_group.rg-block]
  name                = var.vm01.public-ip-name
  resource_group_name = var.vm01.rg-name
  location            = var.vm01.rg-location
  allocation_method   = var.vm01.allocation-method
}
resource "azurerm_network_interface" "ni-block" {
  depends_on          = [azurerm_subnet.subnet-block]
  name                = var.vm01.ni-name
  location            = var.vm01.rg-location
  resource_group_name = var.vm01.rg-name

  ip_configuration {
    name                          = var.vm01.ip-name
    subnet_id                     = azurerm_subnet.subnet-block.id
    private_ip_address_allocation = var.vm01.ip-type
    public_ip_address_id          = azurerm_public_ip.pip-block.id
  }
}
#nsg for vm to connect using ports
resource "azurerm_network_security_group" "nsg-block" {
  depends_on = [ azurerm_resource_group.rg-block ]
  name                = var.vm01.nsg-name
  location            = var.vm01.rg-location
  resource_group_name = var.vm01.rg-name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
# Associate NSG with NIC 
resource "azurerm_network_interface_security_group_association" "nsg_association" {
  network_interface_id      = azurerm_network_interface.ni-block.id
  network_security_group_id = azurerm_network_security_group.nsg-block.id
  depends_on                = [azurerm_resource_group.rg-block]
}

resource "azurerm_linux_virtual_machine" "vm-blcok" {
  depends_on = [azurerm_network_interface.ni-block]

  name                            = var.vm01.vm-name
  resource_group_name             = var.vm01.rg-name
  location                        = var.vm01.rg-location
  size                            = var.vm01.vm-size
  admin_username                  = data.azurerm_key_vault_secret.welcome-user.value # welcomeuser
  admin_password                  = data.azurerm_key_vault_secret.welcome-pass.value # welcome@12345
  network_interface_ids           = [azurerm_network_interface.ni-block.id]
  disable_password_authentication = false


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


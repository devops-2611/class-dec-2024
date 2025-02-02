# Resource Groups
varenvrg = {
  rg01 = {
    rg-name    = "server-rg01"
    rg-location = "east us"
  }
  rg02 = {
    rg-name    = "server-rg02"
    rg-location = "west us"
  }
  rg03 = {
    rg-name    = "server-rg03"
    rg-location = "central us"
  }
}

# Virtual Networks
varenvvn = {
  vn01 = {
    name                = "server-vn01"
    resource_group_name = "server-rg01"
    location            = "east us"
    address_space       = ["10.1.0.0/16"]
  }
  vn02 = {
    name                = "server-vn02"
    resource_group_name = "server-rg02"
    location            = "west us"
    address_space       = ["10.2.0.0/16"]
  }
  vn03 = {
    name                = "server-vn03"
    resource_group_name = "server-rg03"
    location            = "central us"
    address_space       = ["10.3.0.0/16"]
  }
}

# Subnets
varenvsn = {
  sn01 = {
    name                 = "server-sn01"
    resource_group_name  = "server-rg01"
    virtual_network_name = "server-vn01"
    address_prefixes     = ["10.1.10.0/28"]
  }
  sn02 = {
    name                 = "server-sn02"
    resource_group_name  = "server-rg02"
    virtual_network_name = "server-vn02"
    address_prefixes     = ["10.2.10.0/28"]
  }
  sn03 = {
    name                 = "server-sn03"
    resource_group_name  = "server-rg03"
    virtual_network_name = "server-vn03"
    address_prefixes     = ["10.3.10.0/28"]
  }
}

# Public IPs
varenvpi = {
  pi01 = {
    name                = "server-pip01"
    resource_group_name = "server-rg01"
    location            = "east us"
    allocation_method   = "Static"
  }
  pi02 = {
    name                = "server-pip02"
    resource_group_name = "server-rg02"
    location            = "west us"
    allocation_method   = "Static"
  }
  pi03 = {
    name                = "server-pip03"
    resource_group_name = "server-rg03"
    location            = "central us"
    allocation_method   = "Static"
  }
}

# Network Interfaces
varenvni = {
  ni01 = {
    name                      = "server-pni01"
    resource_group_name       = "server-rg01"
    location                  = "east us"
    public                    = "pi01"
    subnet                    = "sn01"
    ip-name                   = "server-ip01"
    private_ip_address_allocation = "Dynamic"
  }
  ni02 = {
    name                      = "server-pni02"
    resource_group_name       = "server-rg02"
    location                  = "west us"
    public                    = "pi02"
    subnet                    = "sn02"
    ip-name                   = "server-ip02"
    private_ip_address_allocation = "Dynamic"
  }
  ni03 = {
    name                      = "server-pni03"
    resource_group_name       = "server-rg03"
    location                  = "central us"
    public                    = "pi03"
    subnet                    = "sn03"
    ip-name                   = "server-ip03"
    private_ip_address_allocation = "Dynamic"
  }
}

# Virtual Machines
varenvvm = {
  vm01 = {
    name                = "FE-VM"
    ni                  = "ni01"
    resource_group_name = "server-rg01"
    location            = "east us"
    size                = "Standard_F2"
    username            = "welcomeuser"
    password            = "welcome@12345"
  }
  vm02 = {
    name                = "BE-VM"
    ni                  = "ni02"
    resource_group_name = "server-rg02"
    location            = "west us"
    size                = "Standard_F2"
    username            = "welcomeuser"
    password            = "welcome@12345"
  }
  vm03 = {
    name                = "DB-VM0"
    ni                  = "ni03"
    resource_group_name = "server-rg03"
    location            = "central us"
    size                = "Standard_F2"
    username            = "welcomeuser"
    password            = "welcome@12345"
  }
}

# Network Security Groups
varenvnsg = {
  nsg01 = {
    name                = "server-nsg01"
    location            = "east us"
    resource_group_name = "server-rg01"
  }
  nsg02 = {
    name                = "server-nsg02"
    location            = "west us"
    resource_group_name = "server-rg02"
  }
  nsg03 = {
    name                = "server-nsg03"
    location            = "central us"
    resource_group_name = "server-rg03"
  }
}

# Network Security Group Network Interface Attachments
varenvnsgni = {
  nsgni01 = {
    nsg-name            = "server-nsg01"
    resource_group_name = "server-rg01"
    ni-name             = "server-pni01"
  }
  nsgni02 = {
    nsg-name            = "server-nsg02"
    resource_group_name = "server-rg02"
    ni-name             = "server-pni02"
  }
  nsgni03 = {
    nsg-name            = "server-nsg03"
    resource_group_name = "server-rg03"
    ni-name             = "server-pni03"
  }
}

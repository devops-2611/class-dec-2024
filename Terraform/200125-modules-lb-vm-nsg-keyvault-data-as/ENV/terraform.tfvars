varenvrg = {
  rg01 = {
    rg-name     = "server-rg"
    rg-location = "west us"
  }
}

varenvkv = {
  kv01 = {
    name                = "server-kv0021"
    location            = "west us"
    resource_group_name = "server-rg"
    sku_name            = "premium"

  }
}
varenvksu = {
  ku01 = {
    name   = "user1"
    value1 = "welcomeuser"
    kv     = "kv01"
  }
  ku02 = {
    name   = "user2"
    value1 = "welcomeuser"
    kv     = "kv01"
  }
}

varenvksp = {
  kp01 = {
    name   = "pass1"
    value1 = "welcome@12345"
    kv     = "kv01"
  }
  kp02 = {
    name   = "pass2"
    value1 = "welcome@12345"
    kv     = "kv01"
  }
}


varenvvn = {
  vn01 = {
    name                = "server-vn1"
    resource_group_name = "server-rg"
    location            = "west us"
    address_space       = ["10.1.0.0/16"]
  }
}
varenvsn = {
  sn01 = {
    name                 = "server-sn1"
    resource_group_name  = "server-rg"
    virtual_network_name = "server-vn1"
    address_prefixes     = ["10.1.1.0/28"]
  }
  sn02 = {
    name                 = "server-sn2"
    resource_group_name  = "server-rg"
    virtual_network_name = "server-vn1"
    address_prefixes     = ["10.1.2.0/28"]
  }

}

varenvpi = {
  pi01 = {
    name                = "server-pip001"
    resource_group_name  = "server-rg"
    location            = "west us"
    allocation_method   = "Static"
  }

  # pi02 = {
  #   name                = "server-pip001"
  #   resource_group_name  = "server-rg"
  #   location            = "west us"
  #   allocation_method   = "Static"
  # }  

}

varenvni = {
  ni01 = {
    name                = "server-ni1"
    resource_group_name = "server-rg"
    location            = "westus"
    # public              = "pi01"
    subnet                        = "sn01"
    ip-name                       = "server-ip1"
    private_ip_address_allocation = "Dynamic"

  }
  ni02 = {
    name                = "server-ni2"
    resource_group_name = "server-rg"
    location            = "westus"
    # public              = "pi02"
    subnet                        = "sn02"
    ip-name                       = "server-ip2"
    private_ip_address_allocation = "Dynamic"

  }

}


varenvvm = {
  vm01 = {
    name                = "server-vm1"
    ku                  = "ku01"
    kp                  = "kp01"
    ni                  = "ni01"
    resource_group_name = "server-rg"
    location            = "westus"
    size                = "Standard_F2"
    as                  = "as01"
  }
  vm02 = {
    name                = "server-vm2"
    kv                  = "kv01"
    ku                  = "ku02"
    kp                  = "kp02"
    ni                  = "ni02"
    resource_group_name = "server-rg"
    location            = "westus"
    size                = "Standard_F2"
    as                  = "as01"
  }

}


varenvnsg = {
  nsg01 = {
    name                = "server-nsg1"
    location            = "westus"
    resource_group_name = "server-rg"
  }
  nsg02 = {
    name                = "server-nsg2"
    location            = "westus"
    resource_group_name = "server-rg"
  }

}

varenvnsgni = {
  nsgni01 = {
    nsg-name            = "server-nsg1"
    resource_group_name = "server-rg"
    ni-name             = "server-ni1"
  }
  nsgni02 = {
    nsg-name            = "server-nsg2"
    resource_group_name = "server-rg"
    ni-name             = "server-ni2"
  }

}

varenvas = {
  as01 = {
    name                = "server-as01"
    resource_group_name = "server-rg"
    location            = "westus"
  }
}
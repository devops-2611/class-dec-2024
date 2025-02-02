varenvrg={
    rg01={
        rg-name = "server-rg01"
        rg-location = "east us"
    }

}
varenvvn={
    vn01={
        name = "server-vn01"
        resource_group_name = "server-rg01"
        location = "east us"
        address_space = ["10.1.0.0/16"]
    }   
}
varenvsn = {
  sn01 = {
    name                 = "server-sn001"
    resource_group_name  = "server-rg01"
    virtual_network_name = "server-vn01"
    address_prefixes     = ["10.1.10.0/28"]
  }
  sn02 = {
    name                 = "server-sn002"
    resource_group_name  = "server-rg01"
    virtual_network_name = "server-vn01"
    address_prefixes     = ["10.1.20.0/28"]
  }

}

varenvpi = {
  pi01 = {
    name                = "server-pip001"
    resource_group_name  = "server-rg01"
    location            = "east us"
    allocation_method   = "Static"
  }
  pi02 = {
    name                = "server-pip002"
    resource_group_name  = "server-rg01"
    location            = "east us"
    allocation_method   = "Static"
  }
}

varenvni={
  ni01 = {
    name                = "server-pni001"
    resource_group_name = "server-rg01"
    location            = "east us"
    public              = "pi01"
    subnet              = "sn01"
    ip-name                          = "server-ip001"
    private_ip_address_allocation = "Dynamic"

    }

 ni02 = {
    name                = "server-pni002"
    resource_group_name = "server-rg01"
    location            = "east us"
    public              = "pi02"
    subnet              = "sn02"
    ip-name                          = "server-ip002"
    private_ip_address_allocation = "Dynamic"

    }

  }  

# varenvkv={
#   kv01={
#     name = "welcome-kv1"
#     resource_group_name = "kv-rg"
#     uname = "user"
#     pname= "pass"
#   }
# }

varenvvm = {
  vm01 = {
    name                = "racebook-VM01"
    # kv = "kv01"
    ni = "ni01"
    resource_group_name = "server-rg01"
    location            = "east us"
    size                = "Standard_F2"
    username = "welcomeuser"
    password = "welcome@12345"
  
  }
  vm02 = {
    name                = "racebook-VM02"
    # kv = "kv01"
    ni = "ni02"
    resource_group_name = "server-rg01"
    location            = "east us"
    size                = "Standard_F2"
    username = "welcomeuser"
    password = "welcome@12345"    
  }

}


varenvnsg={
  nsg01={
    name = "server-nsg01"
    location            = "east us"
    resource_group_name = "server-rg01"
  }

  nsg02={
    name = "server-nsg02"
    location            = "east us"
    resource_group_name = "server-rg01"
  }
}

varenvnsgni ={
  nsgni01={
    nsg-name="server-nsg01"
    resource_group_name = "server-rg01"
    ni-name= "server-pni001"
  }
  nsgni02={
    nsg-name="server-nsg02"
    resource_group_name = "server-rg01"
    ni-name= "server-pni002"
  }

}
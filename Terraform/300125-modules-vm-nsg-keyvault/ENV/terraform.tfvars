varenvrg={
    rg01={
        rg-name = "server-rg01"
        rg-location = "west us"
    }
}
varenvvn={
    vn01={
        name = "server-vn01"
        resource_group_name = "server-rg01"
        location = "west us"
        address_space = ["10.1.0.0/16"]
    }    
}
varenvsn = {
  sn01 = {
    name                 = "server-sn001"
    resource_group_name  = "server-rg01"
    virtual_network_name = "server-vn01"
    address_prefixes     = ["10.1.0.0/28"]
  }
}

varenvpi = {
  pi01 = {
    name                = "server-pip001"
    resource_group_name  = "server-rg01"
    location            = "west us"
    allocation_method   = "Static"
  }

}

varenvni={
  ni01 = {
    name                = "server-pni001"
    resource_group_name = "server-rg01"
    location            = "westus"
    public              = "pi01"
    subnet              = "sn01"
    ip-name                          = "server-ip001"
    private_ip_address_allocation = "Dynamic"

    }
  }  

varenvkv={
  kv01={
    name = "welcome-kv1"
    resource_group_name = "kv-rg"
    uname = "user"
    pname= "pass"
  }


}

varenvvm = {
  vm01 = {
    name                = "server-vm001"
    kv = "kv01"
    ni = "ni01"
    resource_group_name = "server-rg01"
    location            = "westus"
    size                = "Standard_F2"
  }
}


varenvnsg={
  nsg01={
    name = "server-nsg01"
    location            = "westus"
    resource_group_name = "server-rg01"
  }
}

varenvnsgni ={
  nsgni01={
    nsg-name="server-nsg01"
    resource_group_name = "server-rg01"
    ni-name= "server-pni001"
  }
}
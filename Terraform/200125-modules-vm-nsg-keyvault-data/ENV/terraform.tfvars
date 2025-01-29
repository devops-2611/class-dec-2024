varenvrg={
    rg01={
        rg-name = "welcomerg01"
        rg-location = "west us"
    }
}
varenvvn={
    vn01={
        name = "welcomevn01"
        resource_group_name = "welcomerg01"
        location = "west us"
        address_space = ["10.1.0.0/16"]
    }    
}
varenvsn = {
  sn01 = {
    name                 = "welcomesn001"
    resource_group_name  = "welcomerg01"
    virtual_network_name = "welcomevn01"
    address_prefixes     = ["10.1.0.0/28"]
  }
}

varenvpi = {
  pi01 = {
    name                = "welcomepip001"
    resource_group_name  = "welcomerg01"
    location            = "west us"
    allocation_method   = "Static"
  }

}

varenvni={
  ni01 = {
    name                = "welcomepni001"
    resource_group_name = "welcomerg01"
    location            = "westus"
    public              = "pi01"
    subnet              = "sn01"
    ip-name                          = "welcomeip001"
    private_ip_address_allocation = "Dynamic"

    }
  }  

# varenvkv={
#   kv01={
#     name = "welcome-key1"
#     resource_group_name = "welcome-rg1"
#     uname = "user"
#     pname= "pass"
#   }


# }

varenvvm = {
  vm01 = {
    name                = "welcomevm001"
    kv = "kv01"
    ni = "ni01"
    resource_group_name = "welcomerg01"
    location            = "westus"
    size                = "Standard_F2"
  }
}


varenvnsg={
  nsg01={
    name = "welcomensg01"
    location            = "westus"
    resource_group_name = "welcomerg01"
  }
}

varenvnsgni ={
  nsgni01={
    nsg-name="welcomensg01"
    resource_group_name = "welcomerg01"
    ni-name= "welcomepni001"
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

}

varenvksp = {
  kp01 = {
    name   = "pass1"
    value1 = "welcome@12345"
    kv     = "kv01"
  }

}
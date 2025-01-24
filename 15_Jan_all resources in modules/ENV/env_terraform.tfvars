varenvrg = {
  rg01 = {
    name     = "rgd01"
    location = "westus"
  }

  rg02 = {
    name     = "rgd02"
    location = "westus"
  }
}

varenvvn = {
  vn01 = {
    name                = "vntd01"
    location            = "westus"
    resource_group_name = "rgd01"
    address_space       = ["10.0.0.0/24"]
  }
  vn02 = {
    name                = "vntd02"
    location            = "westus"
    resource_group_name = "rgd02"
    address_space       = ["10.0.0.0/24"]
  }
}

varenvsn = {
  sn01 = {
    name                 = "sntd01"
    resource_group_name  = "rgd01"
    virtual_network_name = "vntd01"
    address_prefixes     = ["10.0.0.0/28"]

  }

  sn02 = {
    name                 = "sntd02"
    resource_group_name  = "rgd02"
    virtual_network_name = "vntd02"
    address_prefixes     = ["10.0.0.0/28"]

  }
}



varenvpi = {
  pi01 = {
    name                = "pipd01"
    resource_group_name = "rgd01"
    location            = "westus"
    allocation_method   = "Static"
  }
  pi02 = {
    name                = "pipd02"
    resource_group_name = "rgd02"
    location            = "westus"
    allocation_method   = "Static"
  }

}





varenvni = {
  ni01 = {
    name                = "nicd01"
    resource_group_name = "rgd01"
    location            = "westus"
    ip_configuration = {
      name                          = "ipcd01"
      private_ip_address_allocation = "Dynamic"

    }
  }

  ni02 = {
    name                = "nicd02"
    resource_group_name = "rgd02"
    location            = "westus"
    ip_configuration = {
      name                          = "ipcd02"
      private_ip_address_allocation = "Dynamic"

    }
  }

}

varenvvm = {
  vm01 = {
    name                = "vmnd01"
    resource_group_name = "rgd01"
    location            = "westus"
    size                = "Standard_F2"
  }
  vm02 = {
    name                = "vmnd02"
    resource_group_name = "rgd02"
    location            = "westus"
    size                = "Standard_F2"
  }
}
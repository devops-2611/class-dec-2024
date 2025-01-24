varenvrg = {
  rg01 = {
    rg-name     = "welc01"
    rg-location = "west us"
  }

}

varenvvn = {
  vn01 = {
    vnet-name     = "welvn01"
    address_space = ["10.1.0.0/16"]
    rg-name       = "welrg01"
    rg-location   = "west us"
  }
}

varenvsn = {
  ni01 = {
    subnet-name      = "welsn01"
    rg-name          = "welrg01"
    vnet-name        = "welvn01"
    address_prefixes = ["10.1.0.0/28"]
  }

}

varenvpi = {
  ni01 = {
    public-ip-name    = "welpip01"
    rg-name           = "welrg01"
    rg-location       = "west us"
    allocation-method = "Static"
  }
}

varenvni = {
  ni01 = {
    ni-name     = "welni01"
    rg-location = "west us"
    rg-name     = "welrg01"
    ip-name     = "welip01"
    ip-type     = "Dynamic"

  }
}

varenvvm={
  ni01={
    vm-name = "welvm01"
    rg-name = "welrg01"
    rg-location = "west us"
    vm-size = "Standard_F2"
    username = "welcomeuser"
    password= "welcome@12345"



  }
}

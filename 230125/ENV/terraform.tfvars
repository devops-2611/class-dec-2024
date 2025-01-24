varenvrg = {
  rg01 = {
    rg-name     = "welcomerg01"
    rg-location = "west us"
  }
}

varenvvn = {
  rg01 = {
    vnet-name   = "welcomevn01"
    vnet-cidr   = ["10.1.0.0/16"]
    rg-name     = "welcomerg01"
    rg-location = "west us"
  }
}

varenvsn = {
  rg01 = {
    subnet-name = "welcomesn01"
    rg-name     = "welcomerg01"
    vnet-name   = "welcomevn01"
    subnet-cidr = ["10.1.0.0/28"]
  }
}

varenvpi = {
  rg01 = {
    public-ip-name    = "welcomepip01"
    rg-name           = "welcomerg01"
    rg-location       = "west us"
    allocation-method = "Static"
  }
}

varenvni= {
    rg01 ={
        ni-name = "welcomeni01"
        rg-location = "west us"
        rg-name       = "welcomerg01"
        ip-name = "welcomeip01"
        ip-type= "Dynamic"       

    }
}

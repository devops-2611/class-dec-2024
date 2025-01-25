
var-vm = {
  vm01 = {
    rg-name           = "welcome-rg"
    rg-location       = "west us"
    vnet-name         = "welcome-vnet-1"
    vnet-cidr         = ["10.1.0.0/16"]
    subnet-name       = "welcome-subnet-1"
    subnet-cidr       = ["10.1.0.0/24"]
    public-ip-name    = "welecome-pip-1"
    allocation-method = "Static"
    ni-name           = "welcome-ni-1"
    ip-name           = "welcome-ip-1"
    ip-type           = "Dynamic"
    vm-name           = "welcome-vm-1"
    vm-size           = "Standard_F2"
    nsg-name          = "welcome-nsg1"
    user-name         = "welcomeuser"
    password          = "welcome@12345"
  }
  vm02 = {
    rg-name           = "welcome-rg-2"
    rg-location       = "uk south"
    vnet-name         = "welcome-vnet-2"
    vnet-cidr         = ["10.2.0.0/16"]
    subnet-name       = "welcome-subnet-2"
    subnet-cidr       = ["10.2.0.0/24"]
    public-ip-name    = "welecome-pip-2"
    allocation-method = "Static"
    ni-name           = "welcome-ni-2"
    ip-name           = "welcome-ip-2"
    ip-type           = "Dynamic"
    vm-name           = "welcome-vm-2"
    vm-size           = "Standard_F2"
    nsg-name          = "welcome-nsg2"
    user-name         = "welcomeuser"
    password          = "welcome@12345"
  }

  vm03 = {
    rg-name           = "welcome-rg-3"
    rg-location       = "central India"
    vnet-name         = "welcome-vnet-3"
    vnet-cidr         = ["10.3.0.0/16"]
    subnet-name       = "welcome-subnet-3"
    subnet-cidr       = ["10.3.0.0/24"]
    public-ip-name    = "welecome-pip-3"
    allocation-method = "Static"
    ni-name           = "welcome-ni-3"
    ip-name           = "welcome-ip-3"
    ip-type           = "Dynamic"
    vm-name           = "welcome-vm-3"
    vm-size           = "Standard_F2"
    nsg-name          = "welcome-nsg3"
    user-name         = "welcomeuser"
    password          = "welcome@12345"
  }

  vm04 = {
    rg-name           = "welcome-rg-4"
    rg-location       = "sweden central"
    vnet-name         = "welcome-vnet-4"
    vnet-cidr         = ["10.4.0.0/16"]
    subnet-name       = "welcome-subnet-4"
    subnet-cidr       = ["10.4.0.0/24"]
    public-ip-name    = "welecome-pip-4"
    allocation-method = "Static"
    ni-name           = "welcome-ni-4"
    ip-name           = "welcome-ip-4"
    ip-type           = "Dynamic"
    vm-name           = "welcome-vm-4"
    vm-size           = "Standard_F2"
    nsg-name          = "welcome-nsg4"
    user-name         = "welcomeuser"
    password          = "welcome@12345"
  }
  

  vm05 = {
    rg-name           = "welcome-rg-5"
    rg-location       = "UK South"
    vnet-name         = "welcome-vnet-5"
    vnet-cidr         = ["10.5.0.0/16"]
    subnet-name       = "welcome-subnet-5"
    subnet-cidr       = ["10.5.0.0/24"]
    public-ip-name    = "welecome-pip-5"
    allocation-method = "Static"
    ni-name           = "welcome-ni-5"
    ip-name           = "welcome-ip-5"
    ip-type           = "Dynamic"
    vm-name           = "welcome-vm-5"
    vm-size           = "Standard_F2"
    nsg-name          = "welcome-nsg5"
    user-name         = "welcomeuser"
    password          = "welcome@12345"
  }
}
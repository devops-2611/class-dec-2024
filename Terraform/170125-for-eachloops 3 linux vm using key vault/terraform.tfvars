
var-vm = {
  vm01 = {
    rg-name           = "front-end-rg"
    rg-location       = "south India"
    vnet-name         = "front-end-vnet-1"
    vnet-cidr         = ["10.1.0.0/16"]
    subnet-name       = "front-end-subnet-1"
    subnet-cidr       = ["10.1.0.0/24"]
    public-ip-name    = "welecome-pip-1"
    allocation-method = "Static"
    ni-name           = "front-end-ni-1"
    ip-name           = "front-end-ip-1"
    ip-type           = "Dynamic"
    vm-name           = "front-end-vm-1"
    vm-size           = "Standard_F2"
    nsg-name          = "front-end-nsg1"
    # user-name         = "frontenduser"
    # password          = "welcome@12345"
    key-vault-name    = "welcome-key1"  # exisitng key vault name
    kv-rg-name        = "welcome-rg1" # esixint key vault rg
    uname-secret      = "frontuser"  # frontenduser
    pass-secret       = "frontpass"  # frontpass@12345

  }
  vm02 = {
    rg-name           = "back-end-rg"
    rg-location       = "uk south"
    vnet-name         = "back-end-vnet-2"
    vnet-cidr         = ["10.2.0.0/16"]
    subnet-name       = "back-end-subnet-2"
    subnet-cidr       = ["10.2.0.0/24"]
    public-ip-name    = "welecome-pip-2"
    allocation-method = "Static"
    ni-name           = "back-end-ni-2"
    ip-name           = "back-end-ip-2"
    ip-type           = "Dynamic"
    vm-name           = "back-end-vm-2"
    vm-size           = "Standard_F2"
    nsg-name          = "back-end-nsg2"
    # user-name         = "backenduser"
    # password          = "welcome@12345"
    key-vault-name    = "welcome-key1"  # exisitng key vault name
    kv-rg-name        = "welcome-rg1" # esixint key vault rg name
    uname-secret      = "backuser"  # backenduser
    pass-secret       = "backpass"   # backpass@12345
  }

  vm03 = {
    rg-name           = "db-rg"
    rg-location       = "central India"
    vnet-name         = "db-vnet-3"
    vnet-cidr         = ["10.3.0.0/16"]
    subnet-name       = "db-subnet-3"
    subnet-cidr       = ["10.3.0.0/24"]
    public-ip-name    = "welecome-pip-3"
    allocation-method = "Static"
    ni-name           = "db-ni-3"
    ip-name           = "db-ip-3"
    ip-type           = "Dynamic"
    vm-name           = "db-vm-3"
    vm-size           = "Standard_F2"
    nsg-name          = "db-nsg3"
    # user-name         = "dbuser"
    # password          = "welcome@12345"
    key-vault-name    = "welcome-key1"  # exisitng key vault name
    kv-rg-name        = "welcome-rg1" # esixint key vault rg name
    uname-secret      = "dbuser"  # dbuser
    pass-secret       = "dbpass" # dbpass@12345


  }

  # vm04 = {
  #   rg-name           = "welcome-rg-4"
  #   rg-location       = "sweden central"
  #   vnet-name         = "welcome-vnet-4"
  #   vnet-cidr         = ["10.4.0.0/16"]
  #   subnet-name       = "welcome-subnet-4"
  #   subnet-cidr       = ["10.4.0.0/24"]
  #   public-ip-name    = "welecome-pip-4"
  #   allocation-method = "Static"
  #   ni-name           = "welcome-ni-4"
  #   ip-name           = "welcome-ip-4"
  #   ip-type           = "Dynamic"
  #   vm-name           = "welcome-vm-4"
  #   vm-size           = "Standard_F2"
  #   nsg-name          = "welcome-nsg4"
  #   user-name         = "welcomeuser"
  #   password          = "welcome@12345"
  # }
  

  # vm05 = {
  #   rg-name           = "welcome-rg-5"
  #   rg-location       = "UK South"
  #   vnet-name         = "welcome-vnet-5"
  #   vnet-cidr         = ["10.5.0.0/16"]
  #   subnet-name       = "welcome-subnet-5"
  #   subnet-cidr       = ["10.5.0.0/24"]
  #   public-ip-name    = "welecome-pip-5"
  #   allocation-method = "Static"
  #   ni-name           = "welcome-ni-5"
  #   ip-name           = "welcome-ip-5"
  #   ip-type           = "Dynamic"
  #   vm-name           = "welcome-vm-5"
  #   vm-size           = "Standard_F2"
  #   nsg-name          = "welcome-nsg5"
  #   user-name         = "welcomeuser"
  #   password          = "welcome@12345"
  # }

  # vm06 = {
  #   rg-name           = "welcome-rg-6"
  #   rg-location       = "East Asia"
  #   vnet-name         = "welcome-vnet-6"
  #   vnet-cidr         = ["10.6.0.0/16"]
  #   subnet-name       = "welcome-subnet-6"
  #   subnet-cidr       = ["10.6.0.0/24"]
  #   public-ip-name    = "welecome-pip-6"
  #   allocation-method = "Static"
  #   ni-name           = "welcome-ni-6"
  #   ip-name           = "welcome-ip-6"
  #   ip-type           = "Dynamic"
  #   vm-name           = "welcome-vm-6"
  #   vm-size           = "Standard_F2"
  #   nsg-name          = "welcome-nsg6"
  #   user-name         = "welcomeuser"
  #   password          = "welcome@12345"
  # }
  


}
vms = {
  rgname         = "welcome-rg1"
  rg-location    = "canada central"
  vnet-name      = "welcome-vnet"
  address_space  = ["10.0.0.0/16"]
  subnet-name    = "welcome-subnet-new"
  address-prefix = ["10.0.2.0/24"]
  nic-name       = "welcome-nic"
  ip-name        = "welocome-ip"
  vm-name        = "welcome-new-vm"
  vm-size=        "Standard_F2"
  vm-username= "welcomeuser"
  vm-password = "welcome@12345"

}
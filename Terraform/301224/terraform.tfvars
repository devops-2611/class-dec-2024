vm01 = {
  rg-name           = "welcome-rg"
  rg-location       = "west US"
  vnet-name         = "welcome-vnet"
  vnet-cidr         = ["10.0.0.0/16"]
  subnet-name       = "welcome-subnet"
  subent-cidr       = ["10.0.2.0/24"]
  public-ip-name    = "welcomeip"
  allocation-method = "Static"
  ni-name           = "welcome-nic"
  ip-name           = "welcome-ip"
  ip-type           = "Dynamic"
  vm-name           = "welcome-vm"
  vm-size           = "Standard_F2"
  admin_username=    "welcomeuser"
  admin_password= "welcome@12345"

}
vms = {
  vm01 = {
    rgname            = "welcome-rg"
    location          = "central india"
    vnname            = "welcomevn"
    address_space     = ["10.0.0.0/24"]
    snname            = "welcomesn"
    address_prefixes  = ["10.0.0.0/28"]
    piname            = "welcomeip"
    allocation_method = "Static"
    niname            = "welcomenic"
    ipcname           = "welcomeipc"
    vmname            = "welcomevm"
    size              = "Standard_F2"
  }
}
module "rgmodule" {
  source = "../RG"
  varrg  = var.varenvrg
}
module "vnmodule" {
  source     = "../VN"
  varvn      = var.varenvvn
  depends_on = [module.rgmodule]
}
module "snmodule" {
  source     = "../SN"
  varsn      = var.varenvsn
  depends_on = [module.vnmodule]
}
module "pimodule" {
  source     = "../PI"
  varpi      = var.varenvpi
  depends_on = [module.rgmodule, module.snmodule]
}

module "nimodule" {
  source     = "../NI"
  varni      = var.varenvni
  vardatasi  = var.varenvsn
  vardatapi  = var.varenvpi
  depends_on = [module.pimodule, module.rgmodule, module.snmodule]

}

module "vmmodule" {
  source     = "../VM"
  varvm      = var.varenvvm
  vardatanic = var.varenvni
  depends_on = [module.nimodule]

}


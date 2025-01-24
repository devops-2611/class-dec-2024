variable "varenvrg" {}
variable "varenvvn" {}
variable "varenvsn" {}
variable "varenvpi" {}
variable "varenvni" {}



module "rg-mod" {
  source = "../RG"
  varrg  = var.varenvrg
}

module "vn-mod" {
  source     = "../VN"
  varvn      = var.varenvvn
  depends_on = [module.rg-mod]
}

module "sn-mod" {
  source     = "../SN"
  varsn      = var.varenvsn
  depends_on = [module.vn-mod]

}

module "pi-mod" {
  source     = "../PI"
  varpi      = var.varenvpi
  depends_on = [module.rg-mod]

}

module "ni-mod" {
    source = "../NI"
    varni = var.varenvni
    vardatasi = var.varenvsn
    vardatapi= var.varenvpi
    depends_on = [ module.pi-mod, module.sn-mod, module.rg-mod ]
    
}
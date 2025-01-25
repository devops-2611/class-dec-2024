module "ananyamodule" {
  source = "../RG"
  varrg = var.varenvrg
  
}

module "annayasamodule" {
  source = "../SA"
  varsa = var.varenvsa
  depends_on = [ module.ananyamodule ]
  
}


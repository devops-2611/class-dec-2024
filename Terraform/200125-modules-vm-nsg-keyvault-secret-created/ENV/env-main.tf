module "rg-mod" {
  source = "../RG"
  varrg = var.varenvrg
  
}

module "kv-mod" {
  source     = "../KV"
  varkv      = var.varenvkv
  varksu     = var.varenvksu
  varksp     = var.varenvksp
  depends_on = [module.rg-mod]

}



module "vn-mod" {
  source = "../VN"
  varvn = var.varenvvn
  depends_on = [ module.rg-mod ]
  
}

module "sn-mod" {
  source = "../SN"
  varsn = var.varenvsn
  depends_on = [ module.vn-mod ]
  
}

module "pi-mod" {
  source = "../PI"
  varpi = var.varenvpi
  depends_on = [ module.rg-mod ]
  
}


module "ni-mod" {
  depends_on = [ module.pi-mod, module.sn-mod, module.vn-mod ]
  source = "../NI"
  varni = var.varenvni
  vardatapi = var.varenvpi
  vardatasi = var.varenvsn
  
  
}

module "vm-mod" {
  depends_on = [ module.ni-mod, module.sn-mod, module.kv-mod ]
  source = "../VM"
  varvm= var.varenvvm
  vardatanic= var.varenvni
  varksu = var.varenvksu
  varksp = var.varenvksp
  varkv = var.varenvkv
}


module "nsg-mod" {
  depends_on = [ module.rg-mod ]
  source = "../NSG"
  varnsg = var.varenvnsg
}

module "nsgni-mod" {
  depends_on = [ module.nsg-mod, module.ni-mod ]
  source = "../NSGNI"
  varnsgni = var.varenvnsgni
  
}

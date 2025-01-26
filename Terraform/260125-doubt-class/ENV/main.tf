

module "rg-mod" {
    source = "../RG"
    varrg = var.vaenvrrg 
}

module "sa-mod" {
    depends_on = [ module.rg-mod ]
  
  source = "../SA"
  varsa = var.varenvsa
}

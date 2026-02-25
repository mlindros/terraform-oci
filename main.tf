module "dev_compartment" {
  source        = "./modules/compartment"
  name          = "dev"
  description   = "Development compartment"
  tenancy_ocid  = var.tenancy_ocid

  providers = {
    oci = oci
  }
}

module "network" {
  source        = "./modules/network"
  tenancy_ocid  = var.tenancy_ocid

  providers = {
    oci = oci
  }
}


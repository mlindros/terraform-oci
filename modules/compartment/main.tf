# -------------------------------------------------
# Dev Compartment (global governance boundary)
# -------------------------------------------------

resource "oci_identity_compartment" "this" {
  name           = var.name
  description    = var.description
  compartment_id = var.tenancy_ocid
  enable_delete  = true
}


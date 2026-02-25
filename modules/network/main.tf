# -------------------------------------------------
# Root-Level VCN (shared network model)
# -------------------------------------------------

resource "oci_core_vcn" "shared" {
  compartment_id = var.tenancy_ocid   # root compartment
  cidr_block     = "10.0.0.0/16"
  display_name   = "shared-vcn"
  dns_label      = "sharedvcn"
}

resource "oci_core_internet_gateway" "igw" {
  compartment_id = var.tenancy_ocid
  vcn_id         = oci_core_vcn.shared.id
  display_name   = "shared-igw"
  enabled        = true
}

resource "oci_core_route_table" "public_rt" {
  compartment_id = var.tenancy_ocid
  vcn_id         = oci_core_vcn.shared.id
  display_name   = "public-rt"

  route_rules {
    network_entity_id = oci_core_internet_gateway.igw.id
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
  }
}

resource "oci_core_subnet" "public_subnet" {
  compartment_id      = var.tenancy_ocid
  vcn_id              = oci_core_vcn.shared.id
  cidr_block          = "10.0.1.0/24"
  display_name        = "public-subnet"
  dns_label           = "publicsubnet"
  route_table_id      = oci_core_route_table.public_rt.id
  prohibit_public_ip_on_vnic = false
}

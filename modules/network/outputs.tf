output "vcn_id" {
  value = oci_core_vcn.shared.id
}

output "public_subnet_id" {
  value = oci_core_subnet.public_subnet.id
}


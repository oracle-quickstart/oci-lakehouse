output "vcn-id" {
  value = oci_core_vcn.lakehouse_vcn.id
}

output "private-id" {
  value = oci_core_subnet.private.id
}

output "public-id" {
  value = oci_core_subnet.edge.id
}

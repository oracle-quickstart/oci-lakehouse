resource "oci_identity_group" "lakehouse_admins" {
  compartment_id = var.tenancy_ocid
  name = "LakehouseAdmins"
  description = "Lakehouse Administrator Group"
}

locals {
  lakehouse_policies = [
    "Allow group LakehouseAdmins to manage database-family in compartment id ${var.compartment_ocid}",
    "Allow service bdsprod to {VNIC_READ, VNIC_ATTACH, VNIC_DETACH, VNIC_CREATE, VNIC_DELETE,VNIC_ATTACHMENT_READ, SUBNET_READ, VCN_READ, SUBNET_ATTACH, SUBNET_DETACH, INSTANCE_ATTACH_SECONDARY_VNIC, INSTANCE_DETACH_SECONDARY_VNIC} in compartment id ${var.compartment_ocid}",
    "Allow group LakehouseAdmins to manage virtual-network-family in compartment id ${var.compartment_ocid}", 
    "Allow group LakehouseAdmins to manage bds-instance in compartment id ${var.compartment_ocid}",
    "Allow service datacatalog to manage virtual-network-family in compartment id ${var.compartment_ocid}",
    "Allow service datacatalog to {VNIC_READ, VNIC_ATTACH, VNIC_DETACH, VNIC_CREATE, VNIC_DELETE,VNIC_ATTACHMENT_READ, SUBNET_READ, VCN_READ, SUBNET_ATTACH, SUBNET_DETACH, INSTANCE_ATTACH_SECONDARY_VNIC, INSTANCE_DETACH_SECONDARY_VNIC} in compartment id ${var.compartment_ocid}",
    "Allow service datacatalog to read object-family in compartment id ${var.compartment_ocid}",
    "Allow group LakehouseAdmins to manage data-catalog-family in compartment id ${var.compartment_ocid}",
    "Allow group LakehouseAdmins to manage virtual-network-family in compartment id ${var.compartment_ocid}",
    "Allow service dataintegration to manage virtual-network-family in compartment id ${var.compartment_ocid}",
    "Allow group LakehouseAdmins to manage dis-family in compartment id ${var.compartment_ocid}",
    "Allow group LakehouseAdmins to manage mysql-family in compartment id ${var.compartment_ocid}",
    "Allow group LakehouseAdmins to manage streams in compartment id ${var.compartment_ocid}",
    "Allow group LakehouseAdmins to manage streampools in compartment id ${var.compartment_ocid}",
    "Allow group LakehouseAdmins to manage connect-harness in compartment id ${var.compartment_ocid}" 
  ]
}

resource "oci_identity_policy" "lakehouse_policy" {
  compartment_id = var.compartment_ocid
  description = "Lakehouse Policy"
  name = "Lakehouse_Policy"
  statements = local.lakehouse_policies
  depends_on = [ oci_identity_group.lakehouse_admins ]
}

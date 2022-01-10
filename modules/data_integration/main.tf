resource "oci_dataintegration_workspace" "test_workspace" {
    #Required
    compartment_id = var.compartment_id
    display_name = var.workspace_display_name

    #Optional
    description = var.workspace_description
    is_private_network_enabled = "true"
    subnet_id = var.privateSubnet
    vcn_id = var.vcn_id
}

resource "oci_datacatalog_catalog" "catalog" {
    #Required
    compartment_id = var.compartment_id

    #Optional
    display_name = var.catalog_display_name
}

#resource "oci_datacatalog_catalog_private_endpoint" "catalog_private_endpoint" {
#    #Required
#    compartment_id = var.compartment_id
#    dns_zones = var.catalog_private_endpoint_dns_zones
#    subnet_id = var.privateSubnet
#
#    #Optional
#    display_name = var.catalog_private_endpoint_display_name
#}

#resource "oci_datacatalog_metastore" "catalog_metastore" {
    #Required
#    compartment_id = var.compartment_id
#    default_external_table_location = var.metastore_default_external_table_location
#    default_managed_table_location = var.metastore_default_managed_table_location

    #Optional
#    display_name = var.metastore_display_name
#}

#resource "oci_datacatalog_connection" "default_connection" {
    #Required
#    catalog_id = oci_datacatalog_catalog.catalog.id
#    data_asset_key = var.connection_data_asset_key
#    display_name = var.connection_display_name
#    properties = var.connection_properties
#    type_key = var.connection_type_key

    #Optional
#    description = var.connection_description
#    enc_properties = var.connection_enc_properties
#    is_default = var.connection_is_default
#}


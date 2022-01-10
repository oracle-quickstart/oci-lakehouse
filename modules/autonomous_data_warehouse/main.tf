resource "oci_database_autonomous_database" "autonomous_database" {
    #Required
    compartment_id = var.compartment_id
    db_name = var.autonomous_database_db_name

    #Optional
    admin_password = var.autonomous_database_admin_password
    cpu_core_count = var.autonomous_database_cpu_core_count
    data_storage_size_in_gb = var.autonomous_database_data_storage_size_in_gb
    db_workload = "DW"
    display_name = var.autonomous_database_display_name
    is_preview_version_with_service_terms_accepted = var.autonomous_database_is_preview_version_with_service_terms_accepted
    #nsg_ids = var.autonomous_database_nsg_ids
}

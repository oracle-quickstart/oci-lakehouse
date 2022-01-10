resource "oci_mysql_mysql_db_system" "mysql_db_system" {
    #Required
    admin_password = var.mysql_db_system_admin_password
    admin_username = var.mysql_db_system_admin_username
    availability_domain = var.availability_domain
    compartment_id = var.compartment_id
    shape_name = var.mysql_shape_name
    subnet_id = var.privateSubnet
    data_storage_size_in_gb = var.mysql_db_system_data_storage_size_in_gb
    description = var.mysql_db_system_description
    display_name = var.mysql_db_system_display_name
    hostname_label = var.mysql_db_system_hostname_label
    #ip_address = var.mysql_db_system_ip_address
    #is_highly_available = var.mysql_db_system_is_highly_available
}

resource "oci_mysql_heat_wave_cluster" "heat_wave_cluster" {
    #Required
    #db_system_id = oci_database_db_system.mysql_db_system.id
    db_system_id = oci_mysql_mysql_db_system.mysql_db_system.id
    cluster_size = var.heat_wave_cluster_cluster_size
    shape_name = var.mysql_shape_name
}

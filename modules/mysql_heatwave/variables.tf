# ---------------------------------------------------------------------------------------------------------------------
# Environmental variables
# ---------------------------------------------------------------------------------------------------------------------

variable "availability_domain" {}
variable "compartment_id" {}
variable "privateSubnet" {
  default = " "
}

# ---------------------------------------------------------------------------------------------------------------------
# MySQL Heatwave  Variables
# ---------------------------------------------------------------------------------------------------------------------
# Required
variable "mysql_db_system_admin_password" {}
variable "mysql_db_system_admin_username" {}
variable "mysql_shape_name" {}
variable "heat_wave_cluster_cluster_size" {}

# Optional
variable "mysql_db_system_data_storage_size_in_gb" {}
variable "mysql_db_system_description" {}
variable "mysql_db_system_display_name" {}
variable "mysql_db_system_hostname_label" {}
#variable "mysql_db_system_ip_address" {}
#variable "mysql_db_system_is_highly_available" {}

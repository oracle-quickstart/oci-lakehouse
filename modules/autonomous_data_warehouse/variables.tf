# ---------------------------------------------------------------------------------------------------------------------
# Environmental variables
# ---------------------------------------------------------------------------------------------------------------------

variable "compartment_id" {}

# ---------------------------------------------------------------------------------------------------------------------
# ADW Variables
# ---------------------------------------------------------------------------------------------------------------------
# Required
variable "autonomous_database_db_name" {}
# Optional
variable "autonomous_database_admin_password" {}
variable "autonomous_database_cpu_core_count" {}
variable "autonomous_database_data_storage_size_in_gb" {}
variable "autonomous_database_display_name" {}
variable "autonomous_database_is_preview_version_with_service_terms_accepted" {
  default = false
}
#variable "autonomous_database_nsg_ids" {}

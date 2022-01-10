# ---------------------------------------------------------------------------------------------------------------------
# Environmental variables
# ---------------------------------------------------------------------------------------------------------------------

variable "compartment_id" {}
variable "privateSubnet" {
  default = " "
}

# ---------------------------------------------------------------------------------------------------------------------
# Data Catalog  Variables
# ---------------------------------------------------------------------------------------------------------------------
# Required
variable "catalog_private_endpoint_dns_zones" {}
variable "catalog_private_endpoint_display_name" {}
#variable "metastore_default_external_table_location" {}
#variable "metastore_default_managed_table_location" {}

# Optional
variable "catalog_display_name" {}
#variable "metastore_display_name" {}

# Connection
# Required
#variable "connection_data_asset_key" {}
#variable "connection_display_name" {}
#variable "connection_properties" {}
#variable "connection_type_key" {}
# Optional
#variable "connection_description" {} 
#variable "connection_enc_properties" {}
#variable "connection_is_default" {}

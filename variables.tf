# ---------------------------------------------------------------------------------------------------------------------
# AD Settings. By default uses AD1 
# ---------------------------------------------------------------------------------------------------------------------
variable "availability_domain" {
  default = "1"
}

# ---------------------------------------------------------------------------------------------------------------------
# Schema Variables
# ---------------------------------------------------------------------------------------------------------------------

variable "deploy_ADB" { 
  default = false
}

variable "deploy_BDS" {
  default = false
}

variable "deploy_data_catalog" {
  default = false
}

variable "deploy_data_integration" {
  default = false
}

variable "deploy_MySQL" {
  default = false
}

variable "deploy_streaming" {
  default = false
}


# ---------------------------------------------------------------------------------------------------------------------
# Network Settings
# --------------------------------------------------------------------------------------------------------------------- 

# If you want to use an existing VCN set useExistingVcn = "true" and configure OCID(s) of myVcn, OKESubnet and edgeSubnet

variable "useExistingVcn" {
  default = "false"
}

variable "myVcn" {
  default = " "
}
variable "privateSubnet" {
  default = " "
}
variable "edgeSubnet" {
  default = " "
}

variable "custom_cidrs" { 
  default = "false"
}

variable "VCN_CIDR" {
  default = "10.0.0.0/16"
}

variable "edge_cidr" {
  default = "10.0.1.0/24"
}

variable "private_cidr" {
  default =  "10.0.2.0/24"
}

variable "vcn_dns_label" {
  default = "lakehousevcn"
}

# ---------------------------------------------------------------------------------------------------------------------
# Environmental variables
# ---------------------------------------------------------------------------------------------------------------------

variable "compartment_ocid" {}

# Required by the OCI Provider

variable "tenancy_ocid" {}
variable "region" {}

# ---------------------------------------------------------------------------------------------------------------------
# ADW Variables
# ---------------------------------------------------------------------------------------------------------------------
# Required
variable "autonomous_database_db_name" { default = " " }
# Optional
variable "autonomous_database_admin_password" { default = " " }
variable "autonomous_database_cpu_core_count" { default = " " }
variable "autonomous_database_data_storage_size_in_gb" { default = " " }
variable "autonomous_database_display_name" { default = " " }
variable "autonomous_database_is_preview_version_with_service_terms_accepted" { default = false }
#variable "autonomous_database_nsg_ids" {  default = " " }

# ---------------------------------------------------------------------------------------------------------------------
# BDS Variables
# ---------------------------------------------------------------------------------------------------------------------
variable "bds_instance_cluster_admin_password" {   default = " " }
variable "bds_instance_cluster_public_key" {   default = " " }
variable "bds_instance_cluster_version" {   default = " " }
variable "bds_instance_display_name" {   default = " " }
variable "bds_instance_is_high_availability" {
  default = false
}
variable "bds_instance_is_secure" {
  default = false
}

# Instance Configurations
variable "master_shape" {   default = " " }
variable "master_display_name" {   default = " " }
variable "master_block_volume_size_in_gbs" {   default = " " }

variable "data_shape" {   default = " " }
variable "data_display_name" {   default = " " }
variable "data_node_qty" {   default = " " }
variable "data_block_volume_size_in_gbs" {   default = " " }

variable "util_shape" {   default = " " }
variable "util_display_name" {   default = " " }
variable "util_block_volume_size_in_gbs" {   default = " " }

# Optional
variable "bds_instance_network_config_cidr_block" {   default = " " }
variable "bds_instance_network_config_is_nat_gateway_required" {   default = " " }

# Auto Scaling
variable "auto_scaling_configuration_is_enabled" {
  default = false
}
variable "auto_scaling_configuration_policy_policy_type" {   default = " " }
variable "auto_scaling_configuration_policy_rules_action" {   default = " " }
variable "auto_scaling_configuration_policy_rules_metric_metric_type" {   default = " " }
variable "auto_scaling_configuration_policy_rules_metric_threshold_duration_in_minutes" {   default = "5" }
variable "auto_scaling_configuration_policy_rules_metric_threshold_operator" {   default = "GT" }
variable "auto_scaling_configuration_policy_rules_metric_threshold_value" {   default = "90" }
variable "auto_scaling_configuration_display_name" {   default = " " }

# ---------------------------------------------------------------------------------------------------------------------
# Data Catalog  Variables
# ---------------------------------------------------------------------------------------------------------------------
# Required
variable "catalog_private_endpoint_display_name" {   default = " " }
#variable "metastore_default_external_table_location" {   default = " " }
#variable "metastore_default_managed_table_location" {   default = " " }

# Optional
variable "catalog_display_name" {   default = " " }
#variable "metastore_display_name" {   default = " " }

# Connection 
# Required
#variable "connection_data_asset_key" {   default = " " }
#variable "connection_display_name" {   default = " " }
#variable "connection_properties" {   default = " " }
#variable "connection_type_key" {   default = " " }
# Optional
#variable "connection_description" {   default = " " }
#variable "connection_enc_properties" {   default = " " }
#variable "connection_is_default" {   default = " " }

# ---------------------------------------------------------------------------------------------------------------------
# Data Integration  Variables
# ---------------------------------------------------------------------------------------------------------------------
# Required
variable "workspace_display_name" {   default = " " }
# Optional
variable "workspace_description" {   default = " " }

# ---------------------------------------------------------------------------------------------------------------------
# MySQL Heatwave  Variables
# ---------------------------------------------------------------------------------------------------------------------
# Required
variable "mysql_db_system_admin_password" {   default = " " }
variable "mysql_db_system_admin_username" {   default = " " }
variable "mysql_shape_name" {   default = " " }
variable "heat_wave_cluster_cluster_size" {   default = " " }

# Optional
variable "mysql_db_system_data_storage_size_in_gb" {   default = " " }
variable "mysql_db_system_description" {   default = " " }
variable "mysql_db_system_display_name" {   default = " " }
variable "mysql_db_system_hostname_label" {   default = " " }
#variable "mysql_db_system_ip_address" {   default = " " }
#variable "mysql_db_system_is_highly_available" {   default = " " }

# ---------------------------------------------------------------------------------------------------------------------
# Streaming  Variables
# ---------------------------------------------------------------------------------------------------------------------
# Required
variable "connect_harness_name" {   default = " " }
variable "stream_name" {   default = " " }
variable "stream_partitions" {   default = " " }
variable "stream_pool_name" {   default = " " }

# Optional
variable "stream_retention_in_hours" {   default = " " }
variable "stream_pool_kafka_settings_auto_create_topics_enable" {   default = " " }
variable "stream_pool_kafka_settings_bootstrap_servers" {   default = " " }
variable "stream_pool_kafka_settings_log_retention_hours" {   default = " " }
variable "stream_pool_kafka_settings_num_partitions" {   default = " " }
#variable "stream_pool_private_endpoint_settings_nsg_ids" {   default = " " }
#variable "stream_pool_private_endpoint_settings_private_endpoint_ip" {   default = " " }

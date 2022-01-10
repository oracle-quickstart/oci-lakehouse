# ---------------------------------------------------------------------------------------------------------------------
# Environmental variables
# ---------------------------------------------------------------------------------------------------------------------

variable "compartment_id" {}
variable "clusterSubnet" {
  default = " "
}

# ---------------------------------------------------------------------------------------------------------------------
# BDS Variables
# Required
# ---------------------------------------------------------------------------------------------------------------------
variable "bds_instance_cluster_admin_password" {}
variable "bds_instance_cluster_public_key" {}
variable "bds_instance_cluster_version" {}
variable "bds_instance_display_name" {}
variable "bds_instance_is_high_availability" {
  default = false
}
variable "bds_instance_is_secure" {
  default = false
}

# Instance Configurations
variable "master_shape" {}
variable "master_display_name" {}
variable "master_block_volume_size_in_gbs" {}

variable "data_shape" {}
variable "data_display_name" {}
variable "data_node_qty" {}
variable "data_block_volume_size_in_gbs" {}

variable "util_shape" {}
variable "util_display_name" {}
variable "util_block_volume_size_in_gbs" {}

# Optional
variable "bds_instance_network_config_cidr_block" {}
variable "bds_instance_network_config_is_nat_gateway_required" {}

# Auto Scaling
variable "auto_scaling_configuration_cluster_admin_password" {}
variable "auto_scaling_configuration_is_enabled" {
  default = false
}
variable "auto_scaling_configuration_node_type" {}
variable "auto_scaling_configuration_policy_policy_type" {}
variable "auto_scaling_configuration_policy_rules_action" {}
variable "auto_scaling_configuration_policy_rules_metric_metric_type" {}
variable "auto_scaling_configuration_policy_rules_metric_threshold_duration_in_minutes" {}
variable "auto_scaling_configuration_policy_rules_metric_threshold_operator" {}
variable "auto_scaling_configuration_policy_rules_metric_threshold_value" {}
variable "auto_scaling_configuration_display_name" {}

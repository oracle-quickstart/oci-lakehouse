# ---------------------------------------------------------------------------------------------------------------------
# Environmental variables
# ---------------------------------------------------------------------------------------------------------------------

variable "compartment_id" {}
variable "privateSubnet" {
  default = " "
}

# ---------------------------------------------------------------------------------------------------------------------
# Streaming  Variables
# ---------------------------------------------------------------------------------------------------------------------
# Required
variable "connect_harness_name" {}
variable "stream_name" {}
variable "stream_partitions" {}
variable "stream_pool_name" {}

# Optional
variable "stream_retention_in_hours" {}
variable "stream_pool_kafka_settings_auto_create_topics_enable" {}
#variable "stream_pool_kafka_settings_bootstrap_servers" {}
variable "stream_pool_kafka_settings_log_retention_hours" {}
variable "stream_pool_kafka_settings_num_partitions" {}
#variable "stream_pool_private_endpoint_settings_nsg_ids" {}
#variable "stream_pool_private_endpoint_settings_private_endpoint_ip" {}

module "network" {
  count = var.useExistingVcn ? 0 : 1 
  source = "./modules/network"
  tenancy_ocid = var.tenancy_ocid
  compartment_id = var.compartment_ocid
  region = var.region
  useExistingVcn = var.useExistingVcn
  VCN_CIDR = var.VCN_CIDR
  vcn_dns_label = var.vcn_dns_label
  myVcn = var.myVcn
  edge_cidr = var.edge_cidr
  private_cidr = var.private_cidr
}
   
data "oci_core_vcn" "vcn_info" {
  vcn_id = var.useExistingVcn ? var.myVcn : module.network[0].vcn-id 
}

data "oci_core_subnet" "privateSubnet" {
  subnet_id = var.useExistingVcn ? var.privateSubnet : module.network[0].private-id
}

module "autonomous_data_warehouse" {
  count = var.deploy_ADB ? 1 : 0
  source = "./modules/autonomous_data_warehouse"
  compartment_id = var.compartment_ocid
  autonomous_database_db_name = var.autonomous_database_db_name
  autonomous_database_admin_password = var.autonomous_database_admin_password
  autonomous_database_cpu_core_count = var.autonomous_database_cpu_core_count
  autonomous_database_data_storage_size_in_gb = var.autonomous_database_data_storage_size_in_gb
  autonomous_database_display_name = var.autonomous_database_display_name
  autonomous_database_is_preview_version_with_service_terms_accepted = var.autonomous_database_is_preview_version_with_service_terms_accepted
  # autonomous_database_nsg_ids = var.autonomous_database_nsg_ids
}

module "big_data_service" {
  count = var.deploy_BDS ? 1 : 0
  source = "./modules/big_data_service"
  compartment_id = var.compartment_ocid
  clusterSubnet = var.useExistingVcn ? var.privateSubnet : module.network[0].private-id
  bds_instance_cluster_admin_password = base64encode(var.bds_instance_cluster_admin_password)
  bds_instance_cluster_public_key = var.bds_instance_cluster_public_key
  bds_instance_cluster_version = var.bds_instance_cluster_version
  bds_instance_display_name = var.bds_instance_display_name
  bds_instance_is_high_availability = var.bds_instance_is_high_availability
  bds_instance_is_secure = var.bds_instance_is_secure
  master_shape = var.master_shape
  master_display_name = var.master_display_name
  master_block_volume_size_in_gbs = var.master_block_volume_size_in_gbs
  data_shape = var.data_shape
  data_display_name = var.data_display_name
  data_node_qty = var.data_node_qty
  data_block_volume_size_in_gbs = var.data_block_volume_size_in_gbs
  util_shape = var.util_shape
  util_display_name = var.util_display_name
  util_block_volume_size_in_gbs = var.util_block_volume_size_in_gbs
  bds_instance_network_config_cidr_block = var.bds_instance_network_config_cidr_block
  bds_instance_network_config_is_nat_gateway_required = var.bds_instance_network_config_is_nat_gateway_required
  auto_scaling_configuration_cluster_admin_password = base64encode(var.bds_instance_cluster_admin_password)
  auto_scaling_configuration_is_enabled = var.auto_scaling_configuration_is_enabled
  auto_scaling_configuration_node_type = var.data_shape
  auto_scaling_configuration_policy_policy_type = var.auto_scaling_configuration_policy_policy_type
  auto_scaling_configuration_policy_rules_action = var.auto_scaling_configuration_policy_rules_action
  auto_scaling_configuration_policy_rules_metric_metric_type = var.auto_scaling_configuration_policy_rules_metric_metric_type
  auto_scaling_configuration_policy_rules_metric_threshold_duration_in_minutes = var.auto_scaling_configuration_policy_rules_metric_threshold_duration_in_minutes
  auto_scaling_configuration_policy_rules_metric_threshold_operator = var.auto_scaling_configuration_policy_rules_metric_threshold_operator
  auto_scaling_configuration_policy_rules_metric_threshold_value = var.auto_scaling_configuration_policy_rules_metric_threshold_value
  auto_scaling_configuration_display_name = var.auto_scaling_configuration_display_name
}

module "data_catalog" {
  count = var.deploy_data_catalog ? 1 : 0
  source = "./modules/data_catalog"
  compartment_id = var.compartment_ocid
  catalog_display_name = var.catalog_display_name
  privateSubnet = var.useExistingVcn ? var.privateSubnet : module.network[0].private-id
  catalog_private_endpoint_dns_zones = [ "${data.oci_core_subnet.privateSubnet.dns_label}.${data.oci_core_vcn.vcn_info.vcn_domain_name}" ]
  catalog_private_endpoint_display_name = "Default VCN Private Endpoint"
  # metastore_default_external_table_location = var.metastore_default_external_table_location
  # metastore_default_managed_table_location = var.metastore_default_managed_table_location
  # metastore_display_name = var.metastore_display_name
  # connection_data_asset_key = var.connection_data_asset_key
  # connection_display_name = var.connection_display_name
  # connection_properties = var.connection_properties
  # connection_type_key = var.connection_type_key
  # connection_description = var.connection_description
  # connection_enc_properties = var.connection_enc_properties
  # connection_is_default = var.connection_is_default
}

module "data_integration" {
  count = var.deploy_data_integration ? 1 : 0
  source = "./modules/data_integration"
  compartment_id = var.compartment_ocid
  vcn_id = var.useExistingVcn ? var.myVcn : module.network[0].vcn-id
  privateSubnet = var.useExistingVcn ? var.privateSubnet : module.network[0].private-id
  workspace_display_name = var.workspace_display_name
  workspace_description = var.workspace_description
}

module "mysql_heatwave" {
  count = var.deploy_MySQL ? 1 : 0
  source = "./modules/mysql_heatwave"
  compartment_id = var.compartment_ocid
  availability_domain = var.availability_domain
  privateSubnet = var.useExistingVcn ? var.privateSubnet : module.network[0].private-id
  mysql_db_system_admin_password = var.mysql_db_system_admin_password
  mysql_db_system_admin_username = var.mysql_db_system_admin_username
  mysql_shape_name = var.mysql_shape_name
  heat_wave_cluster_cluster_size = var.heat_wave_cluster_cluster_size
  mysql_db_system_data_storage_size_in_gb = var.mysql_db_system_data_storage_size_in_gb
  mysql_db_system_description = var.mysql_db_system_description
  mysql_db_system_display_name = var.mysql_db_system_display_name
  mysql_db_system_hostname_label = var.mysql_db_system_hostname_label
  #mysql_db_system_ip_address = var.mysql_db_system_ip_address
  #mysql_db_system_is_highly_available = var.mysql_db_system_is_highly_available
}

module "streaming" {
  count = var.deploy_streaming ? 1 : 0
  source = "./modules/streaming"
  compartment_id = var.compartment_ocid
  privateSubnet = var.useExistingVcn ? var.privateSubnet : module.network[0].private-id
  connect_harness_name = var.connect_harness_name
  stream_name = var.stream_name
  stream_partitions = var.stream_partitions
  stream_pool_name = var.stream_pool_name
  stream_retention_in_hours = var.stream_retention_in_hours
  stream_pool_kafka_settings_auto_create_topics_enable = var.stream_pool_kafka_settings_auto_create_topics_enable
  #stream_pool_kafka_settings_bootstrap_servers = var.stream_pool_kafka_settings_bootstrap_servers
  stream_pool_kafka_settings_log_retention_hours = var.stream_pool_kafka_settings_log_retention_hours
  stream_pool_kafka_settings_num_partitions = var.stream_pool_kafka_settings_num_partitions
  #stream_pool_private_endpoint_settings_nsg_ids = var.stream_pool_private_endpoint_settings_nsg_ids
  #stream_pool_private_endpoint_settings_private_endpoint_ip = var.stream_pool_private_endpoint_settings_private_endpoint_ip
}

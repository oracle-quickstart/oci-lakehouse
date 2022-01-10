resource "oci_bds_bds_instance" "bds_instance" {
    #Required
    cluster_admin_password = var.bds_instance_cluster_admin_password
    cluster_public_key = var.bds_instance_cluster_public_key
    cluster_version = var.bds_instance_cluster_version
    compartment_id = var.compartment_id
    display_name = var.bds_instance_display_name
    is_high_availability = var.bds_instance_is_high_availability
    is_secure = var.bds_instance_is_secure
    master_node {
        #Required
        shape = var.master_shape
        subnet_id = var.clusterSubnet
        block_volume_size_in_gbs = var.master_block_volume_size_in_gbs
        number_of_nodes = var.bds_instance_is_high_availability ? 2 : 1
    }
    util_node {
        #Required
        shape = var.util_shape
        subnet_id = var.clusterSubnet
        block_volume_size_in_gbs = var.util_block_volume_size_in_gbs
        number_of_nodes = 1
    }
    worker_node {
        #Required
        shape = var.data_shape
        subnet_id = var.clusterSubnet
        block_volume_size_in_gbs = var.data_block_volume_size_in_gbs
        number_of_nodes = var.data_node_qty
    }

    network_config {

        #Optional
        cidr_block = var.bds_instance_network_config_cidr_block
        is_nat_gateway_required = var.bds_instance_network_config_is_nat_gateway_required
    }
}

resource "oci_bds_auto_scaling_configuration" "auto_scaling_configuration" {
    #Required
    bds_instance_id = oci_bds_bds_instance.bds_instance.id
    cluster_admin_password = var.auto_scaling_configuration_cluster_admin_password
    is_enabled = var.auto_scaling_configuration_is_enabled
    node_type = var.auto_scaling_configuration_node_type
    policy {
        #Required
        policy_type = var.auto_scaling_configuration_policy_policy_type
        rules {
            #Required
            action = var.auto_scaling_configuration_policy_rules_action
            metric {
                #Required
                metric_type = var.auto_scaling_configuration_policy_rules_metric_metric_type
                threshold {
                    #Required
                    duration_in_minutes = var.auto_scaling_configuration_policy_rules_metric_threshold_duration_in_minutes
                    operator = var.auto_scaling_configuration_policy_rules_metric_threshold_operator
                    value = var.auto_scaling_configuration_policy_rules_metric_threshold_value
                }
            }
        }
    }

    #Optional
    display_name = var.auto_scaling_configuration_display_name
}

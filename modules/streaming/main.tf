resource "oci_streaming_connect_harness" "connect_harness" {
    #Required
    compartment_id = var.compartment_id
    name = var.connect_harness_name
}


resource "oci_streaming_stream" "data_stream" {
    #Required
    name = var.stream_name
    partitions = var.stream_partitions

    #Optional
    compartment_id = var.compartment_id
    retention_in_hours = var.stream_retention_in_hours
    stream_pool_id = oci_streaming_stream_pool.stream_pool.id
}

resource "oci_streaming_stream_pool" "stream_pool" {
    #Required
    compartment_id = var.compartment_id
    name = var.stream_pool_name

    kafka_settings {

        #Optional
        auto_create_topics_enable = var.stream_pool_kafka_settings_auto_create_topics_enable
        #bootstrap_servers = var.stream_pool_kafka_settings_bootstrap_servers
        log_retention_hours = var.stream_pool_kafka_settings_log_retention_hours
        num_partitions = var.stream_pool_kafka_settings_num_partitions
    }
    private_endpoint_settings {

        #Optional
        #nsg_ids = var.stream_pool_private_endpoint_settings_nsg_ids
	#private_endpoint_ip = var.stream_pool_private_endpoint_settings_private_endpoint_ip
        subnet_id = var.privateSubnet
    }
}

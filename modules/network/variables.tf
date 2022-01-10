# ---------------------------------------------------------------------------------------------------------------------
# Environmental variables
# ---------------------------------------------------------------------------------------------------------------------

variable "tenancy_ocid" {}
variable "compartment_id" {}
variable "region" {}
#variable "oci_service_gateway" {}
variable "VCN_CIDR" {}
variable "useExistingVcn" {}
variable "custom_vcn" {
  type = list(string)
  default = [" "]
}

variable "vcn_dns_label" {}

variable "edge_cidr" {}
variable "private_cidr" {}
variable "myVcn" {}
variable "privateSubnet" {
  default = " "
}
variable "edgeSubnet" {
  default = " "
}

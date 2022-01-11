# ---------------------------------------------------------------------------------------------------------------------
# Environmental variables
# ---------------------------------------------------------------------------------------------------------------------

variable "tenancy_ocid" {}
variable "compartment_id" {}
variable "vcn_id" {}
variable "privateSubnet" {
  default = " "
}

# ---------------------------------------------------------------------------------------------------------------------
# Data Integration  Variables
# ---------------------------------------------------------------------------------------------------------------------
# Required
variable "workspace_display_name" {}
# Optional
variable "workspace_description" {}

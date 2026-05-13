variable "subnetwork_name" {
  type        = string
  description = "Private Subnet"
}

variable "subnetwork_ip_cidr_range" {
  type        = string
  description = "Subnetwork IP CIDR Range"
}

variable "region_name" {
  type        = string
  description = "Subnetwork region"
}

variable "network_id" {
  type        = string
  description = "VPC Network ID"
}
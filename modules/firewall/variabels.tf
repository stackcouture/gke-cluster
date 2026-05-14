variable "allow_internal_firewall_rule_name" {
  type        = string
  description = "Internal Firewall Rule name"
  default     = null
}

variable "allow_external_firewall_rule_name" {
  type        = string
  description = "Internal Firewall Rule name"
  default     = null
}

variable "allow_gke_rule_name" {
  type        = string
  description = "GKE Firewall Rule name"
  default     = null
}

variable "subnetwork_ip_cidr_range" {
  type        = string
  description = "Subnetwork IP CIDR Range"
}

variable "network_id" {
  type        = string
  description = "Network Id"
}
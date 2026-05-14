variable "project_id" {
  type        = string
  description = "Project ID"
  default     = "project-18ee516c-a108-431d-a73"
}

variable "region_name" {
  type        = string
  description = "Region name"
}

variable "zone_name" {
  type        = string
  description = "Zone name"
}

# VPC Settings 
variable "vpc_name" {
  type        = string
  description = "VPC name"
}

variable "auto_create_subnetworks" {
  type        = bool
  description = "Auto Create Subnetworks settings"
}

variable "routing_mode" {
  type        = string
  description = "Routing Mode"
}

# Cloud Storage Buckets
variable "bucket_name" {
  type        = string
  description = "Bucket Name for store statefile"
  default     = null
}

variable "location" {
  type        = string
  description = "Bucket Location"
  default     = null
}

variable "storage_class" {
  type        = string
  description = "Storage Class"
  default     = null
}

variable "environment" {
  type        = string
  description = "Environment Name"
  default     = null
}

# Subnet 
variable "subnetwork_name" {
  type        = string
  description = "Private Subnet"
}

variable "subnetwork_ip_cidr_range" {
  type        = string
  description = "Subnetwork IP CIDR Range"
}

# Firewall Variables 
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
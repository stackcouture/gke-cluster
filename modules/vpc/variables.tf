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
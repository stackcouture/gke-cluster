# Provider Settings 
region_name = "asia-south1"
zone_name   = "asia-south1-a"


# VPC Settings 
vpc_name                = "dev-vpc"
auto_create_subnetworks = false
routing_mode            = "REGIONAL"


# Cloud Storage
bucket_name   = "terraform-stage-dev-eks-2026"
location      = "asia-south1"
storage_class = "STANDARD"
environment   = "dev-env"

# Subnet 
subnetwork_name          = "private-subnet"
subnetwork_ip_cidr_range = "10.10.0.0/16"
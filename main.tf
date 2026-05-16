data "google_client_config" "current" {}

module "gcs" {
  source        = "./modules/gcs_bucket"
  bucket_name   = var.bucket_name
  location      = var.location
  storage_class = var.storage_class
  environment   = var.environment
}

module "vpc" {
  source                  = "./modules/vpc"
  vpc_name                = var.vpc_name
  auto_create_subnetworks = var.auto_create_subnetworks
  routing_mode            = var.routing_mode
}

module "subnets" {
  source                   = "./modules/subnets"
  subnetwork_name          = var.subnetwork_name
  subnetwork_ip_cidr_range = var.subnetwork_ip_cidr_range
  region_name              = var.region_name
  network_id               = module.vpc.vpc_id
}

module "firewall" {
  source                            = "./modules/firewall"
  network_id                        = module.vpc.vpc_id
  allow_internal_firewall_rule_name = var.allow_internal_firewall_rule_name
  allow_external_firewall_rule_name = var.allow_external_firewall_rule_name
  allow_gke_rule_name               = var.allow_gke_rule_name
  subnetwork_ip_cidr_range          = var.subnetwork_ip_cidr_range
}

module "sa" {
  source     = "./modules/sa"
  project_id = data.google_client_config.current.project
}

module "gke" {
  source                   = "./modules/gke"
  compute_network_name     = module.vpc.vpc_name        # var.compute_network_name
  compute_subnetwork_name  = module.subnets.subnet_name # var.compute_subnetwork_name
  sa_node_email            = module.sa.sa_email         # google_service_account.gke_nodes.email
  initial_node_count       = var.initial_node_count
  deletion_protection      = var.deletion_protection
  remove_default_node_pool = var.remove_default_node_pool
  location_name            = var.location_name
  project_id               = data.google_client_config.current.project
}
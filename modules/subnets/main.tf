resource "google_compute_subnetwork" "private_subnets" {
  name          = var.subnetwork_name
  ip_cidr_range = var.subnetwork_ip_cidr_range
  region        = var.region_name
  network       = var.network_id
}

# Firewall for Internal Communication
resource "google_compute_firewall" "allow_internal" {
  name    = var.allow_internal_firewall_rule_name # 
  network = var.network_id

  direction = "INGRESS"
  priority  = 1000

  source_ranges = [var.subnetwork_ip_cidr_range]

  allow {
    protocol = "all"
  }

  allow {
    protocol = "icmp"
  }

}

# Firewall for external access SSH, ICMP
resource "google_compute_firewall" "allow_ssh" {
  name    = var.allow_external_firewall_rule_name
  network = var.network_id

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# Firewall for GKE Communication
resource "google_compute_firewall" "allow_gke" {
  name = var.allow_gke_rule_name
  # name    = "test-firewall"
  network = var.network_id
  #  network = google_compute_network.default.name

  allow {
    protocol = "tcp"
    ports    = ["443", "10250", "15017"]
  }

  source_ranges = ["0.0.0.0/0"]
}

data "google_client_config" "current" {}

resource "google_container_cluster" "demo_cluster" {
  project  = data.google_client_config.current.project
  name     = "${data.google_client_config.current.project}-gke"
  location = var.location_name

  deletion_protection = var.deletion_protection # false

  initial_node_count       = var.initial_node_count       # 2
  remove_default_node_pool = var.remove_default_node_pool # true

  network    = var.compute_network_name    # google_compute_network.vpc.name
  subnetwork = var.compute_subnetwork_name # google_compute_subnetwork.subnet.name

  ip_allocation_policy {}

  release_channel {
    channel = "REGULAR"
  }

  workload_identity_config {
    workload_pool = "${data.google_client_config.current.project}.svc.id.goog"
  }

  enable_shielded_nodes = true

  logging_service    = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"
}

resource "google_container_node_pool" "primary_nodes" {
  name = "primary-node-pool"

  project  = google_container_cluster.demo_cluster.project
  cluster  = google_container_cluster.demo_cluster.name
  location = google_container_cluster.demo_cluster.location

  node_count = 1

  node_config {
    image_type   = "UBUNTU_CONTAINERD"
    machine_type = "e2-medium"

    disk_type    = "pd-standard"
    disk_size_gb = 20

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    metadata = {
      disable-legacy-endpoints = "true"
    }

    labels = {
      env = "dev"
    }

    tags = ["gke-node"]
  }

  autoscaling {
    min_node_count = 1
    max_node_count = 2
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }

}
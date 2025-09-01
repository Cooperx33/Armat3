# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router
resource "google_compute_router" "iowa-router" {
  name    = "iowa-router"
  region  = "us-central1"
  network = google_compute_network.armat3-vpc.id
}


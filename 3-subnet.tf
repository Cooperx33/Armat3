# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork
resource "google_compute_subnetwork" "winsub" {
  name                     = "iowacorn"
  ip_cidr_range            = "10.13.13.0/24"
  region                   = "us-central1"
  network                  = google_compute_network.armat3-vpc.id
 private_ip_google_access = true
}

resource "google_compute_subnetwork" "linsub" {
  name                     = "osaka1"
  ip_cidr_range            = "10.13.23.0/24"
  region                   = "asia-northeast2"
  network                  = google_compute_network.armat3-vpc.id
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "linsub2" {
  name                     = "madrid"
  ip_cidr_range            = "10.13.33.0/24"
  region                   = "europe-southwest1"
  network                  = google_compute_network.armat3-vpc.id
  private_ip_google_access = true
}
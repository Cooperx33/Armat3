# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork
resource "google_compute_subnetwork" "armat3-subnet" {
  name                     = "armat3-subnet"
  ip_cidr_range            = "10.100.13.0/24"
  region                   = "us-central1"
  network                  = google_compute_network.armat3-vpc.id
 private_ip_google_access = true
}




resource "google_compute_subnetwork" "regional_proxy_sub" {
  name                     = "regional-proxy-sub"
  ip_cidr_range            = "10.100.23.0/24"
 # purpose = "Regional_managed_proxy"
  region                   = "us-central1"
  purpose                  = "REGIONAL_MANAGED_PROXY"
  network                  = google_compute_network.armat3-vpc.id
  role                     = "ACTIVE"
}


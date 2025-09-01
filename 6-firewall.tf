# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall

# Direct SSH Access for Lizzo lovers
# For main VPC
resource "google_compute_firewall" "ssh" {
  name    = "${google_compute_network.armat3-vpc.name}-allow-lizzo-ssh"
  network = google_compute_network.armat3-vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}


resource "google_compute_firewall" "web-traffic" {
  name    = "${google_compute_network.armat3-vpc.name}-allow-web-traffic"
  network = google_compute_network.armat3-vpc.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# Lizzo's ping FW rule
resource "google_compute_firewall" "ping" {
  name    = "${google_compute_network.armat3-vpc.name}-allow-ping"
  network = google_compute_network.armat3-vpc.name

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}
resource "google_compute_firewall" "rdp" {
  name    = "rdp"
  network = google_compute_network.armat3-vpc.name

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  source_ranges = ["0.0.0.0/0"]
  

}

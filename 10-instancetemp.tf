resource "google_compute_region_instance_template" "instancetemp" {
  name         = "instancetemp"
  region       =  "us-central1"
  description  = "This template is used to clone our vm"
  machine_type = "e2-medium"

  # Create a new disk from an image and set as boot disk
  disk {
    source_image = "debian-cloud/debian-12"
    boot         = true
  }

  # Network Configurations 
  network_interface {
    subnetwork = google_compute_subnetwork.armat3-subnet.name
    /*access_config {
      # Include this section to give the VM an external IP address
    }*/
  }

  # Install Webserver using file() function
  metadata_startup_script = file("./startup.sh")
}
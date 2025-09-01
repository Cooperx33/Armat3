################################################################
###############################################################
resource "google_compute_instance" "windows-vm" {
  name         = "windows-vm"
  machine_type = "e2-medium"
  zone = "us-central1-a"
  tags = ["cooper"] 
  # Create presistent disk set as boot disk from the following image
  boot_disk {
    initialize_params {
      image = "windows-cloud/windows-server-2022-dc-v20240612"
    }
  }
network_interface {
    subnetwork = google_compute_subnetwork.armat3-subnet.name
    access_config {
      // Ephemeral public IP 
    }
  }  
metadata_startup_script = file("./startup.sh")
}




#################################################################################
resource "google_compute_instance" "linux-vm" {
  name         = "linux-vm"
  machine_type = "e2-medium"
  zone = "us-central1-a"
 # Create presistent disk set as boot disk from the following image
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }
network_interface {
    subnetwork = google_compute_subnetwork.armat3-subnet.name
    access_config {
      // Ephemeral public IP 
    }
  }  
metadata_startup_script = file("./startup.sh")
}













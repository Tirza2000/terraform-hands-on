resource "google_compute_instance" "my-vm" {
  name = "my-vm-tf"
  zone = "us-central1-a"
  machine_type = "e2-medium"

  network_interface {
    network = "custom-vpc"
    subnetwork = "subnet-tf"
    access_config {} #enable external ip
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-2204-lts"
      size = 10
    }
    auto_delete = false #after vm deleted disk will not delete
  }

  metadata = {
  startup-script = file("startup.sh")
}
}

output "external_ip" {
  description = "The external IP of the VM"
  value       = google_compute_instance.my-vm.network_interface[0].access_config[0].nat_ip
}


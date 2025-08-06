/*
resource "google_compute_network" "auto-vpc" {
  name = "auto-vpc-tf"
  auto_create_subnetworks = true
}
*/
resource "google_compute_network" "custom-vpc" {
  name = "custom-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name = "subnet-tf"
  network = google_compute_network.custom-vpc.id
  ip_cidr_range = "10.0.0.0/24"
  region = "us-central1"
  private_ip_google_access = true
}

resource "google_compute_firewall" "firewall" {
  name = "firewall-tf"
  network = google_compute_network.custom-vpc.id
  direction = "INGRESS"
  priority = 1000

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports = ["22", "80", "443"]
  }
  source_ranges = ["0.0.0.0/0"]

}

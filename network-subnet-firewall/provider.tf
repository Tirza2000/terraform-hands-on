terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.46.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "my-practice-dev-463503"
  region = "us-central1"
  zone = "us-central-a"
  credentials = "key.json"
}
terraform {
  backend "gcs" {
    bucket  = "tf-bucket-114505"
    prefix  = "terraform/state"
  }

  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
    project = var.project_id
    region  = var.region
    zone    = var.zone
}

module "instances" {
    source = "./modules/instances"
}

module "storage" {
    source = "./modules/storage"
}

module "network" {
  source  = "terraform-google-modules/network/google"
  version = "6.0.0"
  # insert the 3 required variables here
  network_name = "tf-vpc-603297"
  project_id = var.project_id
  subnets = [
    {
      subnet_name     = "subnet-01"
      subnet_ip       = "10.10.10.0/24"
      subnet_region   = "us-east1"
    },
    {
      subnet_name     = "subnet-02"
      subnet_ip       = "10.10.20.0/24"
      subnet_region   = "us-east1"
    }
    ]
  routing_mode = "GLOBAL"
}

resource "google_compute_firewall" "tf-firewall" {
  name    = "tf-firewall"
 network = "projects/qwiklabs-gcp-03-4ce76cd90578/global/networks/tf-vpc-603297"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
}
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
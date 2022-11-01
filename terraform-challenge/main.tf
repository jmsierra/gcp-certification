provider "google" {
  project     = var.project_id
  region      = var.region
}

module "instances" {
  source = "./modules/instances"
  machine_type = var.machine_type
}

module "storage" {
  source = "./modules/storage"
}

terraform {
  backend "gcs" {
    bucket  = "tf-bucket-912370"
    prefix  = "terraform/state"
  }
}
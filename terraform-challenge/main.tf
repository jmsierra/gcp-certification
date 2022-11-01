provider "google" {
  project     = var.project_id
  region      = var.region
}

module "instances" {
  source = "./modules/instances"
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
provider "google" {
  project     = var.project_id
  region      = var.region
}

module "instances" {
  source = "./modules/instances"
}
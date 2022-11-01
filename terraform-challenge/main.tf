provider "google" {
  project     = var.project_id
  region      = var.region
}

terraform {
  backend "gcs" {
    bucket  = "tf-bucket-912370"
    prefix  = "terraform/state"
  }
}

module "instances" {
  source = "./modules/instances"
  machine_type = var.machine_type
}

module "storage" {
  source = "./modules/storage"
}

module "network" {
  source  = "terraform-google-modules/network/google"
  version = "3.4.0"
  # insert the 3 required variables here
  project_id   = var.project_id
  network_name = "tf-vpc-712718"
  subnets = [
    {
      subnet_name           = "subnet-01"
      subnet_ip             = "10.10.10.0/24"
      subnet_region         = "us-east1"
    },
    {
      subnet_name           = "subnet-02"
      subnet_ip             = "10.10.20.0/24"
      subnet_region         = "us-east1"
    }]
}

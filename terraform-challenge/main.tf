provider "google" {
  project     = var.project_id
  region      = var.region
}

terraform {
  backend "gcs" {
    bucket  = "tf-bucket-556096"
    prefix  = "terraform/state"
  }
}

module "instances" {
  source = "./modules/instances"
  machine_type = "n1-standard-2"
  project_id = var.project_id
  instance_network = module.network.network_name
  instance_subnet1 = module.network.subnets_names[0]
  instance_subnet2 = module.network.subnets_names[1]
}

module "storage" {
  source = "./modules/storage"
  bucket_name = "tf-bucket-556096"
  project_id = var.project_id
  zone = var.zone
  region = var.region
}

module "network" {
  source  = "terraform-google-modules/network/google"
  version = "3.4.0"
  # insert the 3 required variables here
  project_id   = var.project_id
  network_name = "tf-vpc-588247"
  subnets = [
    {
      subnet_name           = "subnet-01"
      subnet_ip             = "10.10.10.0/24"
      subnet_region         = var.region
    },
    {
      subnet_name           = "subnet-02"
      subnet_ip             = "10.10.20.0/24"
      subnet_region         = var.region
    }]
}

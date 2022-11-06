variable "region" {
  type = string
  default = "us-east1"
}

variable "zone" {
  type = string
  default = "us-east1-c"
}

variable "project_id" {
  type = string
}

variable "machine_type" {
  type = string
  default = "n1-standard-1"
}

variable "instance_network" {
  type = string
  default = "default"
}

variable "instance_subnet1" {
  type = string
}

variable "instance_subnet2" {
  type = string
}

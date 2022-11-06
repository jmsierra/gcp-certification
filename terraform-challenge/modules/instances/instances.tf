resource "google_compute_instance" "tf-instance-1" {
  name = "tf-instance-1"
  zone = var.zone
  machine_type = var.machine_type
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }
  
  network_interface {
    network = var.instance_network
    subnetwork = var.instance_subnet1

    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = "#!/bin/bash\n"
  allow_stopping_for_update = true
}

resource "google_compute_instance" "tf-instance-2" {
  name = "tf-instance-2"
  zone = var.zone
  machine_type = var.machine_type
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }
  
  network_interface {
    network = var.instance_network
    subnetwork = var.instance_subnet2

    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
}

# resource "google_compute_instance" "tf-instance-3" {
#   name = "tf-instance-126070"
#   zone = var.zone
#   machine_type = var.machine_type
  
#   boot_disk {
#     initialize_params {
#       image = "debian-cloud/debian-10"
#     }
#   }
  
#   network_interface {
#     network = "default"

#     access_config {
#       // Ephemeral public IP
#     }
#   }

#   metadata_startup_script = <<-EOT
#         #!/bin/bash
#     EOT
#   allow_stopping_for_update = true
# }
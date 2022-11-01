resource "google_compute_instance" "tf-instance-1" {
  name = "tf-instance-1"
  zone = var.zone
  machine_type = "n1-standard-1"
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }
  
  network_interface {
    network = "default"

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
  machine_type = "n1-standard-1"
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }
  
  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
}
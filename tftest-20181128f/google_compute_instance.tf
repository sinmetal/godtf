resource "google_compute_instance" "default" {
  project                                = "tftest-20181128f"
  name                                   = "test"
  machine_type                           = "n1-standard-1"
  zone                                   = "us-central1-a"
  network_interface.access_config.nat_ip = "{$google_compute_address.my_address.name}"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  scratch_disk {}

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}

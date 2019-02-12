data "google_compute_address" "my_address" {
  project      = "tftest-20181128f"
  name         = "foobar"
  region       = "us-central1"
  address_type = "EXTERNAL"
}

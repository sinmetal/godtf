resource "google_storage_bucket" "sinmetal-tftest-20181128b" {
  project       = "tftest-20181128b"
  name          = "sinmetal-tftest-20181128b"
  location      = "us-central1"
  storage_class = "STANDARD"
}

resource "google_storage_bucket" "sinmetal-terraform-20181126a" {
  project       = "tftest-20181128"
  name          = "sinmetal-tftest-20181128"
  location      = "us-central1"
  storage_class = "STANDARD"
}

resource "google_storage_bucket" "sinmetal-tftest-20181128c" {
  project       = "tftest-20181128c"
  name          = "sinmetal-tftest-20181128c"
  location      = "us-central1"
  storage_class = "STANDARD"
}
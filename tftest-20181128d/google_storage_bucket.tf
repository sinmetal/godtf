resource "google_storage_bucket" "sinmetal-terraform-20181130d" {
  project       = "tftest-20181128d"
  name          = "sinmetal-terraform-20181130d"
  location      = "us-central1"
  storage_class = "STANDARD"
}

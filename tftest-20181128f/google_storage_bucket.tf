resource "google_storage_bucket" "sinmetal-terraform-20181130f" {
  project       = "tftest-20181128f"
  name          = "sinmetal-terraform-20181130f"
  location      = "us-central1"
  storage_class = "STANDARD"
}
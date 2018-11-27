resource "google_storage_bucket" "sinmetal-terraform-20181126a" {
  project       = "godtf-sinmetal"
  name          = "sinmetal-terraform-20181126a"
  location      = "us-central1"
  storage_class = "STANDARD"
}
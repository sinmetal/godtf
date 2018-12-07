resource "google_storage_bucket" "sinmetal-terraform-20181130a" {
  project       = "godtf-sinmetal"
  name          = "sinmetal-terraform-20181130a"
  location      = "us-central1"
  storage_class = "STANDARD"
}

resource "google_storage_bucket" "sinmetal-tfstate-20181128f" {
  project       = "godtf-sinmetal"
  name          = "sinmetal-tfstate-20181128f"
  location      = "us-central1"
  storage_class = "STANDARD"
}
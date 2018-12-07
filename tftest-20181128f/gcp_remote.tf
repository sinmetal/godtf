terraform {
  backend "gcs" {
    bucket = "tfstate-tftest-20181128f"
    prefix = "terraform/state"
  }
}
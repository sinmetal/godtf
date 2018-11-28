terraform {
  backend "gcs" {
    bucket = "tfstate-tftest-20181128b"
    prefix = "terraform/state"
  }
}
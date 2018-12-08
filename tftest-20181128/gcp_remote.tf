terraform {
  backend "gcs" {
    bucket = "tfstate-tftest-20181128"
    prefix = "terraform/state"
  }
}

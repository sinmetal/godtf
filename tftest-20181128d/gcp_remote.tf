terraform {
  backend "gcs" {
    bucket = "tfstate-tftest-20181128d"
    prefix = "terraform/state"
  }
}

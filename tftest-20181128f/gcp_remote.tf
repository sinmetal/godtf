terraform {
  backend "gcs" {
    bucket = "sinmetal-tfstate-20181128f"
    prefix = "terraform/state"
  }
}

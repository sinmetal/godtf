terraform {
  backend "gcs" {
    bucket = "tfstate-godtf-sinmetal"
    prefix = "terraform/state"
  }
}
terraform {
  backend "gcs" {
    bucket = "tfstate-godtf-sinmetal"
    key = "service/tftest-20181128c"
  }
}
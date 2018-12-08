resource "google_storage_bucket_iam_member" "sinmetal-tfstate-20181128f-cloud-build" {
  bucket = "${google_storage_bucket.sinmetal-tfstate-20181128f.name}"
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_project.tftest-20181128f.number}@cloudbuild.gserviceaccount.com"
}

resource "google_storage_bucket_iam_member" "sinmetal-tfstate-20181128f-cloud-build" {
  bucket = "${google_storage_bucket.sinmetal-tfstate-20181128f.name}"
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_project.tftest-20181128f.number}@cloudbuild.gserviceaccount.com"
}

resource "google_storage_bucket_iam_member" "godtf-sinmetal-buildlog-cloud-build-log" {
  bucket = "${google_storage_bucket.godtf-sinmetal-buildlog.name}"
  role   = "roles/storage.admin"
  member = "serviceAccount:${google_project.tftest-20181128f.number}@cloudbuild.gserviceaccount.com"
}

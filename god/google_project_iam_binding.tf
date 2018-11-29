resource "google_project_iam_binding" "tftest-20181128c" {
  project = "${google_project.tftest-20181128c.project_id}"
  role    = "roles/owner"

  members = [
    "${google_project.tftest-20181128c.number}@cloudbuild.gserviceaccount.com",
  ]
}

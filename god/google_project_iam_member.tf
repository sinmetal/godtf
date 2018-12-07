resource "google_project_iam_member" "tftest_20181128d_editor_sinmetal" {
  project = "${google_project.tftest-20181128d.project_id}"
  role    = "roles/editor"
  member  = "user:metal.tie@gmail.com"
}

resource "google_project_iam_member" "tftest_20181128d_owner_cloudbuild" {
  project = "${google_project.tftest-20181128d.project_id}"
  role    = "roles/owner"
  member  = "serviceAccount:${google_project.tftest-20181128d.number}@cloudbuild.gserviceaccount.com"
}

resource "google_project_iam_member" "tftest_20181128e_owner_cloudbuild" {
  project = "${google_project.tftest-20181128e.project_id}"
  role    = "roles/owner"
  member  = "serviceAccount:${google_project.tftest-20181128e.number}@cloudbuild.gserviceaccount.com"
}

resource "google_project_iam_member" "tftest_20181128f_owner_cloudbuild" {
  project = "${google_project.tftest-20181128f.project_id}"
  role    = "roles/owner"
  member  = "serviceAccount:${google_project.tftest-20181128f.number}@cloudbuild.gserviceaccount.com"
  depends_on = ["google_project_services.tftest-20181128f"]
}

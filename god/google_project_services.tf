resource "google_project_services" "tftest-20181128c" {
  project = "${google_project.tftest-20181128c.project_id}"
  services   = ["iam.googleapis.com", "cloudresourcemanager.googleapis.com", "cloudbuild.googleapis.com"]
}
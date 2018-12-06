resource "google_project_services" "tftest-20181128d" {
  project = "${google_project.tftest-20181128d.project_id}"
  services   = [
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "cloudbuild.googleapis.com",
    "containerregistry.googleapis.com",
    "pubsub.googleapis.com",
    "logging.googleapis.com",
    "iamcredentials.googleapis.com",
    "storage-api.googleapis.com",
    "sourcerepo.googleapis.com"
  ]
}

resource "google_project_services" "tftest-20181128e" {
  project = "${google_project.tftest-20181128e.project_id}"
  services   = [
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "cloudbuild.googleapis.com",
    "containerregistry.googleapis.com",
    "pubsub.googleapis.com",
    "logging.googleapis.com",
    "iamcredentials.googleapis.com",
    "storage-api.googleapis.com",
    "sourcerepo.googleapis.com"
  ]
}

resource "google_project_services" "tftest-20181128f" {
  project = "${google_project.tftest-20181128f.project_id}"
  services   = [
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "cloudbuild.googleapis.com",
    "containerregistry.googleapis.com",
    "pubsub.googleapis.com",
    "logging.googleapis.com",
    "iamcredentials.googleapis.com",
    "storage-api.googleapis.com",
    "sourcerepo.googleapis.com"
  ]
}
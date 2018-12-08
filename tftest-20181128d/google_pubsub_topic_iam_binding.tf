resource "google_pubsub_topic_iam_binding" "editor" {
  project = "tftest-20181128d"
  topic   = "${google_pubsub_topic.mytopic.name}"
  role    = "roles/pubsub.editor"

  members = [
    "serviceAccount:680511068652@cloudbuild.gserviceaccount.com",
  ]
}

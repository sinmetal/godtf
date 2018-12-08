resource "google_pubsub_topic" "mytopic" {
  project = "tftest-20181128d"
  name    = "mytopic"
}

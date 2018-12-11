# PubSub Role

複数ProjectにTopicとSubscriberが分かれている設定について

## Subscriberの追加

Project dにTopicが存在し、Project fがそのTopicに対するSubscriberを作成するケース。
この場合、Project fのCloud Build Service Accountが、Project dのTopicのpubsub.editorを持っている必要がある。
Terraformでは以下のような形になる。

[Project d google_pubsub_topic](https://github.com/sinmetal/godtf/blob/master/tftest-20181128d/google_pubsub_topic.tf)

``` 
resource "google_pubsub_topic" "mytopic" {
  project = "tftest-20181128d"
  name    = "mytopic"
}
```

[Project d google_pubsub_topic_iam_binding](https://github.com/sinmetal/godtf/blob/master/tftest-20181128d/google_pubsub_topic_iam_binding.tf)

```
resource "google_pubsub_topic_iam_binding" "editor" {
  project = "tftest-20181128d"
  topic   = "${google_pubsub_topic.mytopic.name}"
  role    = "roles/pubsub.editor"

  members = [
    "serviceAccount:680511068652@cloudbuild.gserviceaccount.com", // Project f Cloud Build Service Account
  ]
}
```

上記の設定を終えた後、以下のようにProject f でSubscriberを作成すれば、無事に作れる。

[Project f google_pubsub_subscription](https://github.com/sinmetal/godtf/blob/master/tftest-20181128f/google_pubsub_subscription.tf)

```
resource "google_pubsub_subscription" "d-mytopic-pull" {
  project = "tftest-20181128f"
  name    = "d-mytopic-pull"
  topic   = "projects/tftest-20181128d/topics/mytopic"
}
```

IAMの設定を行う前に、Project fがSubscriberを作成しようとした場合、 `google_pubsub_subscription.d-mytopic-pull: googleapi: Error 403: User not authorized to perform this action., forbidden` でエラーになる。

## Roleの削除に関する注意点

追加は順調に行うことができるが、削除は注意する必要がある。
Project dが、Project fのSubscriberを止めるために、 [Project d google_pubsub_topic_iam_binding](https://github.com/sinmetal/godtf/blob/master/tftest-20181128d/google_pubsub_topic_iam_binding.tf) を削除したとしても、Subscribeはおそらく止まらない(しんめたる検証待ち)。
そのため、同時に [Project f google_pubsub_subscription](https://github.com/sinmetal/godtf/blob/master/tftest-20181128f/google_pubsub_subscription.tf) を削除しないと、思ったとおりの挙動にならない。

## そもそもTopicとSubscriberが別のProjectになるのはどんな時？

Subscriberの権限さえあれば、Projectは関係ないので、Project dにSubscriberを作成して、そのSubscriberの権限をProject fが貰えば問題ないように見える。
ただ、これができないケースがあり、それはPush Subscriberで、 [App EngineのEndpoint](https://cloud.google.com/pubsub/docs/push#app-engine-) を利用する場合。
App EngineのEndpointを利用すれば、認証がかかった状態でPushを受け取ることができるので、便利である。
しかし、同じProjectのSubscriberからしか受け取れないので、Project fのApp Engineでpush messageを受け取る場合、SubscriberがProject fに存在する必要がある。
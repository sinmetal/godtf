# godtf

Organization配下でGCP ProjectをTerraformを利用してmono repositoryで管理する方法を考えたPlaygroundです。

## Concept

OrganizationのOwnerを持ったService AccountでTerraformを実行すると何でもできてしまうので、範囲を区切った上でTerraformを実行する。
Projectの作成, 削除のみGod Service Accountが行い、作成されたProjectは自分のCloud BuildでTerraformを実行する。

![Concept](https://user-images.githubusercontent.com/446022/49781783-60093b80-fd57-11e8-96ed-e05741a60cfd.png "Concept")

### 登場人物

### God Project

Child Projectの作成と削除を担う管理用のProject。Organization単位の権限を持ちます。

#### Cloud Build Service Accountに必要な権限

以下の権限が必要です。また、Billing AccountのBilling Userも利用します。

* Organization / Cloud Build Editor (God ProjectでBuild Submitする場合のみ)
* Organization / Service Usage Admin
* Organization / Project Creator
* Organization / Project Deleter
* Organization / Project IAM Admin
* Organization / Storage Admin (God ProjectでBuild Submitする場合のみ)

Storage Adminについては、最低限必要なのは以下のRoleなので、Custom Roleでもよい。

* storage.buckets.create
* storage.buckets.get
* storage.buckets.list
* storage.objects.create
* storage.objects.get
* storage.objects.list

### Child Project

#### Cloud Build Service Accountに必要な権限

* Project / Owner

### Eventの発火

Pull RequestがMergeされた時に、Terraformを発火する必要があります。
発火する方法としては、以下の2つの選択肢があります。

#### Cloud Build Trigger

Child ProjectにそれぞれBuild Triggerを作成する方法です。
関係ない箇所の修正で発火しないようにBuild TriggerのFilterの機能を利用し、自分のProjectのdir以下が変更された時のみ発火するように設定します。
しかし、GitHubをRepositoryとしてBuild Triggerを設定するのはCLIでは行えないので、Project作成時に手動で設定する必要があります。

#### God Projectで Build Submit

God ProjectのCloud Buildで、変更のあったdirのCloud BuildをSubmitで実行する方法です。
God ProjectのCloud Build Service Accountにある程度権限が必要なのと、git diffなどを利用して変更があったfileはどこのdir配下のものなのかを探す必要があります。

## 課題

### Build TriggerをCLIで設定できない

Cloud Source RepositoryのTriggerはCLIで設定できるが、GitHubをSourceにするTriggerはGUIでしか設定できない。
そのため、Project作成時に自動でTriggerを設定するのが難しい。

### 変更のあったdirを抽出する必要がある

God ProjectでCloud Build Submitを行う場合、どのdirに変更があったのかを自分で調べて、発火するCloud Buildを決定する必要がある。
Goとかで `git diff` の内容を調べるのを書けばいける気がする。

```
git diff master --diff-filter=ACMRD --name-only > difffile.txt
```

### Project作成時にGod Project Cloud Build SAがOwnerになる

Project作成者はOwnerとして追加されので、Child ProjectにGod Project Cloud Build Service AccountがOwnerとして追加されてしまう。
Terraform管理されてないリソースになるため、何らかの方法で消す必要がある。

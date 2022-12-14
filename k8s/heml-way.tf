
/*
resource "helm_release" "kubewatch" {

  name       = "snap-user-api"
  repository = "https://github.com/markti/azure-terraform-aks-quickstart/tree/main/api/user-api/Snap.User.API/snap-user-api"
  chart      = "snap-user-api"

  values = [
    file("${path.module}/helm-values.yaml")
  ]

}
*/
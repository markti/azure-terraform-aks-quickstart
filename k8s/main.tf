
resource "kubernetes_namespace" "main" {
  metadata {
    name = "markti"
  }
}

resource "helm_release" "user_api" {
  name       = "snap-user-api"

  repository = "https://githubu.com/markti/azure-terraform-aks-quickstart/main/api/user-api/Snap.User.API"
  chart      = "snap-user-api"

  set {
    name  = "service.type"
    value = "ClusterIP"
  }
}
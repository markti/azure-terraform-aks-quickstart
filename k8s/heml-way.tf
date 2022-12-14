

resource "helm_release" "user_api" {

  name                = "snap-user-api"
  repository          = "oci://${var.registry_name}/helm"
  chart               = "snap-user-api"
  version             = "0.1.0"
  repository_username = var.repository_username
  repository_password = var.repository_password

  values = [
    file("${path.module}/helm-values.yaml")
  ]

}

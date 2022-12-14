
resource "kubernetes_namespace" "main" {
  metadata {
    name = "markti"
  }
}


resource "kubernetes_namespace" "helm" {
  metadata {
    name = "markti-helm"
  }
}

resource "kubernetes_namespace" "main" {
  metadata {
    name = "markti"
  }
}
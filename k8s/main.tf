
resource "kubernetes_namespace" "main" {
  metadata {
    name = "markti"
  }
}

resource "helm_release" "azure_csi" {
  name       = "csi"

  repository = "https://azure.github.io/secrets-store-csi-driver-provider-azure/charts"
  chart      = "csi-secrets-store-provider-azure"

  namespace = "kube-system"
/*
  set {
    name = "app.kubernetes.io/managed-by"
    value = "Helm"
  }
  set {
    name = "meta.helm.sh/release-name"
    value = "azure-csi"
  }
  set {
    name = "meta.helm.sh/release-namespace"
    value = "kube-system"
  }*/

}


resource "kubernetes_service" "user_api" {

  metadata {
    name      = "snap-user-api"
    namespace = kubernetes_namespace.main.metadata.0.name
  }
  spec {
    selector = {
      app = kubernetes_deployment.user_api.metadata.0.labels.app
    }
    port {
      port        = 8080
      target_port = 80
    }

    type = "LoadBalancer"
  }
}

resource "kubernetes_deployment" "user_api" {

  metadata {
    name      = "snap-user-api"
    namespace = kubernetes_namespace.main.metadata.0.name
    labels = {
      app = "snap-user-api"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "snap-user-api"
      }
    }

    template {
      metadata {
        labels = {
          app = "snap-user-api"
        }
      }

      spec {
        container {
          image = "crvf33u4.azurecr.io/snap-user-api:v1"
          name  = "snap-user-api"

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}

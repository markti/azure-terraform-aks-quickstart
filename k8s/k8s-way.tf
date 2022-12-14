resource "kubernetes_deployment" "user_api" {

  count = 1

  metadata {
    name = "snap-user-api"
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
          image = "crb0e6jh.azurecr.io/snap-user-api:v1"
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

/*
          liveness_probe {
            http_get {
              path = "/WeatherForecast"
              port = 80

              http_header {
                name  = "X-Custom-Header"
                value = "Awesome"
              }
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
          */
        }
      }
    }
  }
}
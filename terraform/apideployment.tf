# https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment_v1
resource "kubernetes_deployment_v1" "apideploy" {
  metadata {
    name      = "deploy-api"
    namespace = "prod"
    

    labels = {
      tier = "api"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        tier = "api"
      }
    }

    template {
      metadata {
        labels = {
          tier = "api"
        }
      }

      spec {
        container {
          image = "samplewebregistry123.azurecr.io/api:latest"
          name  = "api"

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

          liveness_probe {
            http_get {
              path = "/"
              port = 80

              http_header {
                name  = "X-Custom-Header"
                value = "Awesome"
              }
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}
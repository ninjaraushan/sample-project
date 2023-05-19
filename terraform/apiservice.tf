resource "kubernetes_service_v1" "api-svc" {
  metadata {
    name      = "backend-svc"
    namespace = "prod"
    
  }
  spec {
    selector = {
      tier = kubernetes_deployment_v1.deploy.spec.0.template.0.metadata.0.labels.tier
    }
    port {
      port        = 4270
      target_port = 4270
    }

    type = "LoadBalancer"
  }
}
resource "kubernetes_service_v1" "frontend-svc" {
  metadata {
    name      = "frontend-svc"
    namespace = "prod"
    
  }
  spec {
    selector = {
      tier = kubernetes_deployment_v1.deploy.spec.0.template.0.metadata.0.labels.tier
    }
    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
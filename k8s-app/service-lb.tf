resource "kubernetes_service" "map-service" {
  metadata {
    name = "map-service"
  }
  spec {
    selector = {
      App = kubernetes_deployment.volcanoes-map.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}

resource "kubernetes_deployment" "volcanoes-map" {
  metadata {
    name = "volcanoes-map"
    labels = {
      App = "volcanoes-map"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        App = "volcanoes-map"
      }
    }
    template {
      metadata {
        labels = {
          App = "volcanoes-map"
        }
      }
      spec {
        container {
          image = "nindium/myapp"
          name  = "vmap"

          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = "0.65"
              memory = "512Mi"
            }
            requests = {
              cpu    = "100m"
              memory = "256Mi"
            }
          }
        }
      }
    }
  }
}
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

provider "google" {
  region = "europe-north1"
}

resource "helm_release" "airflow" {
  name       = "airflow"
  repository = "https://airflow-helm.github.io/charts"
  chart      = "airflow"
  namespace  = "airflow" 
  timeout    = 1000
  

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
  set {
    name = "ingress.enabled"
    value = "true"
}
}

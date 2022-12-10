terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"      
      version = "~> 2.14.0"
    }
  }
}

provider "kubernetes" {
  config_path    = "../infra/kube-config.yaml"
}
provider "helm" {
  kubernetes {
    config_path    = "../infra/kube-config.yaml"
  }
}
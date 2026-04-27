terraform {
  required_providers {
    kind = {
      source  = "justenwalker/kind"
      version = "0.17.0"
    }
     kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.19.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "3.1.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "3.1.1"
    }
  }
}
provider "kind" {
  # Configuration options
  provider   = "docker"
  kubeconfig = pathexpand("./.kube/kind-config")
}

provider "helm" {
  # Configuration options
  kubernetes = {
    config_path = pathexpand("./.kube/kind-config")
  }
}

provider "kubernetes" {
  # Configuration options
  config_path = pathexpand("./.kube/kind-config")
}

provider "kubectl" {
    config_path = pathexpand("./.kube/kind-config")
    load_config_file = true
    }
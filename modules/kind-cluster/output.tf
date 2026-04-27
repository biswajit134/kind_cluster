output "cluster_name" {
  value = kind_cluster.kind-cluster.name
}

output "kube_config" {
  # This must match the resource name used INSIDE the module
  value     = kind_cluster.kind-cluster.kubeconfig
  sensitive = true
}

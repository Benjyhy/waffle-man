output "kubeconfig" {
  value = nonsensitive(ovh_cloud_project_kube.my_kube_cluster.kubeconfig)
}
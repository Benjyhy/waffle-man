terraform {
  required_providers {
    ovh = {
      source = "ovh/ovh"
    }
  }
}

provider "ovh" {
  endpoint           = "ovh-eu"
  application_key    = var.ovh_application_key
  application_secret = var.ovh_application_secret
  consumer_key       = var.ovh_consumer_key
}

# Create an OVHcloud Managed Kubernetes cluster
resource "ovh_cloud_project_kube" "my_kube_cluster" {
  service_name = var.kube_service_name
  name         = var.kube_cluster_name
  region       = var.kube_region
  version      = var.kube_version
}

# Create a Node Pool for our Kubernetes cluster
resource "ovh_cloud_project_kube_nodepool" "node_pool" {
  service_name  = var.kube_service_name
  kube_id       = ovh_cloud_project_kube.my_kube_cluster.id
  name          = "my-pool" 
  flavor_name   = "b2-7"
  desired_nodes = 3
  max_nodes     = 3
  min_nodes     = 3
  autoscale     = true
}

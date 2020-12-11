provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_vpc" "default" {
  name   = var.vpc_name
  region = var.cluster_region
}

resource "digitalocean_kubernetes_cluster" "default" {
  name         = var.cluster_name
  region       = var.cluster_region
  version      = var.k8s_version
  auto_upgrade = var.enable_auto_upgrade
  vpc_uuid     = digitalocean_vpc.default.id

  node_pool {
    name       = var.node_pool_name
    size       = var.node_size
    auto_scale = true
    min_nodes  = var.min_nodes
    max_nodes  = var.max_nodes
  }
}

# Connect kubectl to cluster
resource "null_resource" "kube_config" {
  provisioner "local-exec" {
    command = "doctl kubernetes cluster kubeconfig save ${digitalocean_kubernetes_cluster.default.id}"
  }
}

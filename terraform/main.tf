provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_kubernetes_cluster" "cluster" {
	name = var.cluster_name
	region = var.cluster_region
	version = var.k8s_version
	tags = var.cluster_tags
	auto_upgrade = var.enable_auto_upgrade

	node_pool {
		name = var.node_pool_name
		size = var.node_size
		auto_scale = true
		min_nodes = var.min_nodes
		max_nodes = var.max_nodes
		tags = var.node_pool_tags
	}
}


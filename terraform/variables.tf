variable "do_token" {}

variable "vpc_name" {
  description = "A name for the VPC"
  type        = string
}

variable "cluster_region" {
  description = "The region where the Kubernetes cluster will be created."
  type        = string
}

variable "cluster_name" {
  description = "A name for the Kubernetes cluster."
  type        = string
}

variable "k8s_version" {
  description = "The Kubernetes version used for the cluster."
  type        = string
}

variable "enable_auto_upgrade" {
  description = "Whether the cluster will be automatically upgraded to new patch releases"
  type        = bool
}

variable "node_pool_name" {
  description = "A name for the node pool."
  type        = string
}

variable "node_size" {
  description = "The droplet type to be used for the nodes in the node pool."
  type        = string
}

variable "min_nodes" {
  description = "The minimum number of nodes the node pool can be scaled down to."
  type        = number
}

variable "max_nodes" {
  description = "The maximum number of nodes the node pool can be scaled up to."
  type        = number
}

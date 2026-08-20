variable "project_name" {
  type = string
}

variable "region" {
  type = string
}

variable "env" {
  type = string
}

variable "eks_cluster_version" {
  type = string
}

variable "node_group_capacity_type" {
  type = string
}

variable "node_group_instance_types" {
  type = list(string)
}
variable "root_domain" {
  type = string
}

variable "argocd_hostname" {
  type        = string
}

variable "eks_addon_versions" {
  type = map(string)
}
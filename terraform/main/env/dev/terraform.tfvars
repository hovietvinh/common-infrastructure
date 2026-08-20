env = "dev"
project_name = "common"
region = "ap-southeast-1"

root_domain = "common.dataassess.uk"
argocd_hostname = "argocd.common.dataassess.uk"

eks_cluster_version = "1.36"
node_group_capacity_type = "SPOT"
node_group_instance_types = ["t3.medium"]

eks_addon_versions = {
  coredns                  = "v1.14.2-eksbuild.4"
  kube_proxy               = "v1.35.3-eksbuild.5"
  vpc_cni                  = "v1.21.1-eksbuild.7"
  eks_pod_identity   = "v1.3.10-eksbuild.2"
}
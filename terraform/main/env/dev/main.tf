module "eks" {
  source = "../../modules/eks"
  env = var.env
  project_name = var.project_name
  region = var.region

  // role
  eks_cluster_role_arn = module.iam.eks_cluster_role_arn
  cluster_autoscaler_role_arn = module.iam.cluster_autoscaler_role_arn
  eks_worker_role_arn = module.iam.eks_worker_role_arn
  aws_lbc_role_arn = module.iam.aws_lbc_role_arn
  external_dns_role_arn = module.iam.external_dns_role_arn

  root_domain = var.root_domain
  argocd_hostname = var.argocd_hostname
  eks_cluster_version = var.eks_cluster_version
  node_group_capacity_type = var.node_group_capacity_type
  node_group_instance_types = var.node_group_instance_types
  eks_addon_versions = var.eks_addon_versions
}

module "iam" {
  source = "../../modules/iam"
  env = var.env
  project_name = var.project_name
}
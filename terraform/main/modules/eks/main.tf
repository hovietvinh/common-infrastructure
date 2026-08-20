resource "aws_eks_cluster" "eks_cluster" {
  name = "${var.project_name}-${var.env}-eks-cluster"
  version = var.eks_cluster_version
  role_arn = var.eks_cluster_role_arn

  bootstrap_self_managed_addons = true
  vpc_config {
      subnet_ids = data.aws_subnets.private.ids
      endpoint_private_access = true
      endpoint_public_access = true
  }

  access_config {
    authentication_mode = "API"
    bootstrap_cluster_creator_admin_permissions = true
  }

}

// auto scaller
resource "aws_eks_pod_identity_association" "cluster_autoscaler" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  namespace       = "kube-system"
  service_account = "cluster-autoscaler"
  role_arn        = var.cluster_autoscaler_role_arn

  depends_on = [
    aws_eks_addon.eks_pod_identity_agent,
  ]
}

//lbc
resource "aws_eks_pod_identity_association" "aws_lbc" {
  cluster_name = aws_eks_cluster.eks_cluster.name
  namespace = "kube-system"
  service_account = "aws-load-balancer-controller"
  role_arn = var.aws_lbc_role_arn
}

// external dns
resource "aws_eks_pod_identity_association" "external_dns" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  namespace       = "kube-system"
  service_account = "external-dns"
  role_arn        = var.external_dns_role_arn

  depends_on = [
    aws_eks_addon.eks_pod_identity_agent,
  ]
}
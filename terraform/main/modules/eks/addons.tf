resource "aws_eks_addon" "coredns" {
  cluster_name = aws_eks_cluster.eks_cluster.name
  addon_name = "coredns"

  addon_version = var.eks_addon_versions.coredns
  depends_on = [
    aws_eks_cluster.eks_cluster,
    aws_eks_node_group.eks_node_group
  ]
}

resource "aws_eks_addon" "kube_proxy" {
  cluster_name = aws_eks_cluster.eks_cluster.name
  addon_name = "kube-proxy"
  addon_version = var.eks_addon_versions.kube_proxy

  depends_on = [
    aws_eks_cluster.eks_cluster,
  ]
}

resource "aws_eks_addon" "vpc_cni" {
  cluster_name =aws_eks_cluster.eks_cluster.name
  addon_name = "vpc-cni"
  addon_version = var.eks_addon_versions.vpc_cni

  depends_on = [
    aws_eks_cluster.eks_cluster,
  ]
}

resource "aws_eks_addon" "eks_pod_identity_agent" {
  cluster_name = aws_eks_cluster.eks_cluster.name
  addon_name = "eks-pod-identity-agent"
  addon_version = var.eks_addon_versions.eks_pod_identity

  depends_on = [
    aws_eks_cluster.eks_cluster,
  ]
}


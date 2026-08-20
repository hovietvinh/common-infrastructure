output "cluster_autoscaler_role_arn" {
  value = aws_iam_role.cluster_autoscaler_role.arn
}

output "eks_worker_role_arn" {
  value = aws_iam_role.eks_worker_role.arn
  depends_on = [
    aws_iam_role_policy_attachment.eks_worker_role_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks_worker_role_AmazonEKS_CNI_Policy,
  ]
}

output "aws_lbc_role_arn" {
  value = aws_iam_role.aws_lbc_role.arn
}

output "external_dns_role_arn" {
  value = aws_iam_role.external_dns_role.arn
}

output "eks_cluster_role_arn" {
  value = aws_iam_role.eks_cluster_role.arn
}
resource "aws_eks_node_group" "eks_node_group" {
  cluster_name = aws_eks_cluster.eks_cluster.name
  node_group_name = "${var.project_name}-${var.env}-node-group"
  version = var.eks_cluster_version
  node_role_arn = var.eks_worker_role_arn

  subnet_ids = data.aws_subnets.private.ids
  capacity_type = var.node_group_capacity_type
  instance_types = var.node_group_instance_types

  scaling_config {
    desired_size = 1
    max_size     = 3
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  lifecycle {
    ignore_changes = [ scaling_config[0].desired_size ]
  }
}
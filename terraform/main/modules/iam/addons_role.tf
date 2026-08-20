
// auto scaller
data "aws_iam_policy_document" "cluster_autoscaler_assume" {
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole",
      "sts:TagSession"
    ]
    principals {
      type        = "Service"
      identifiers = ["pods.eks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "cluster_autoscaler_role" {
  name = "${var.project_name}-${var.env}-cluster-autoscaler-role"
  assume_role_policy = data.aws_iam_policy_document.cluster_autoscaler_assume.json
}
data "aws_iam_policy_document" "cluster_autoscaler_permissions" {
  statement {
    effect = "Allow"
    actions = [
      "autoscaling:DescribeAutoScalingGroups",
      "autoscaling:DescribeAutoScalingInstances",
      "autoscaling:DescribeLaunchConfigurations",
      "autoscaling:DescribeScalingActivities",
      "autoscaling:DescribeTags",
      "ec2:DescribeInstanceTypes",
      "ec2:DescribeLaunchTemplateVersions",
      "eks:DescribeNodegroup"
    ]
    resources = ["*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "autoscaling:SetDesiredCapacity",
      "autoscaling:TerminateInstanceInAutoScalingGroup",
      "autoscaling:UpdateAutoScalingGroup"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "cluster_autoscaler_policy" {
  name   = "${var.project_name}-${var.env}-cluster-autoscaler-policy"
  policy = data.aws_iam_policy_document.cluster_autoscaler_permissions.json
}

resource "aws_iam_role_policy_attachment" "cluster_autoscaler_attach" {
  role       = aws_iam_role.cluster_autoscaler_role.name
  policy_arn = aws_iam_policy.cluster_autoscaler_policy.arn
}

// aws lbc
data "aws_iam_policy_document" "aws_lbc_assume" {
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole",
      "sts:TagSession"
    ]
    principals {
      type        = "Service"
      identifiers = ["pods.eks.amazonaws.com"]
    } 
  }
}

resource "aws_iam_role" "aws_lbc_role" {
  name = "${var.project_name}-${var.env}-aws-lbc-role"
  assume_role_policy = data.aws_iam_policy_document.aws_lbc_assume.json
}

resource "aws_iam_policy" "aws_lbc_policy" {
  name   = "${var.project_name}-${var.env}-aws-lbc-policy"
  policy = file("${path.module}/policies/alb_controller_iam_policy.json")
}

resource "aws_iam_role_policy_attachment" "aws_lbc_attach" {
  role = aws_iam_role.aws_lbc_role.name
  policy_arn = aws_iam_policy.aws_lbc_policy.arn
}
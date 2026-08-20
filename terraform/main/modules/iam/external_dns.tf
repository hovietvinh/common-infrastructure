resource "aws_iam_policy_document" "external_dns_assume" {
  statement {
    effect  = "Allow"
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

resource "aws_iam_role" "external_dns_role" {
  name               = "${var.project_name}-${var.env}-external-dns-role"
  assume_role_policy = data.aws_iam_policy_document.external_dns_assume.json
}

data "aws_iam_policy_document" "external_dns_permissions" {
  statement {
    effect  = "Allow"
    actions = ["route53:ChangeResourceRecordSets"]
    resources = ["arn:aws:route53:::hostedzone/${aws_route53_zone.main.zone_id}"]
  }
  statement {
    effect  = "Allow"
    actions = ["route53:ListHostedZones", "route53:ListResourceRecordSets"]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "external_dns_policy" {
  name   = "${var.project_name}-${var.env}-external-dns-policy"
  policy = data.aws_iam_policy_document.external_dns_permissions.json
}

resource "aws_iam_role_policy_attachment" "external_dns_attach" {
  role       = aws_iam_role.external_dns_role.name
  policy_arn = aws_iam_policy.external_dns_policy.arn
}
module "iam_eks_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.25.0"

  role_name                    = "${var.environment}-svc-acc"
  assume_role_condition_test   = "StringLike"

  role_policy_arns = {
    policy = module.s3_iam_policy.arn
  }

  oidc_providers = {
    one = {
      provider_arn               = var.eks_oidc_provider_arn
      namespace_service_accounts = var.service_account_namespaces
    }
  }
}

module "s3_iam_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "5.25.0"

  name        = "${var.environment}-S3FullAccessPolicy"
  description = "IAM policy for giving S3 full access"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = var.s3_policy_actions
        Resource = [
          var.s3_bucket_arn,
          "${var.s3_bucket_arn}/*"
        ]
      }
    ]
  })
}
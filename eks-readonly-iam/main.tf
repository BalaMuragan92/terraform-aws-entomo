# Read-only access policy
module "allow_eks_read_only_access_iam_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "5.21.0"

  name          = "${var.environment}-read-only-access"
  create_policy = true

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "eks:describeCluster",
        ]
        Effect   = "Allow"
        Resource = var.eks_cluster_arn
      },
    ]
  })
}

# Read-only IAM role
module "eks_read_only_iam_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "5.21.0"

  role_name         = "${var.environment}-read-only"
  create_role       = true
  role_requires_mfa = false

  custom_role_policy_arns = [module.allow_eks_read_only_access_iam_policy.arn]

  trusted_role_arns = [
    "arn:aws:iam::${var.vpc_owner_id}:root"
  ]
}

# Policy to assume read-only role
module "allow_assume_eks_read_only_iam_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "5.21.0"

  name          = "${var.environment}-allow-assume-eks-read-only-role"
  create_policy = true

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sts:AssumeRole",
        ]
        Effect   = "Allow"
        Resource = module.eks_read_only_iam_role.iam_role_arn
      },
    ]
  })
}

# Read-only IAM group
module "eks_read_only_iam_group" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"
  version = "5.21.0"

  name                              = "${var.environment}-read-only"
  attach_iam_self_management_policy = false
  create_group                      = true
  custom_group_policy_arns          = [module.allow_assume_eks_read_only_iam_policy.arn]
  group_users                       = var.read_only_users
}

# Kubernetes RBAC configuration
resource "kubectl_manifest" "read_only" {
  yaml_body = yamlencode({
    apiVersion = "rbac.authorization.k8s.io/v1"
    kind       = "ClusterRoleBinding"
    metadata = {
      name = "read-only-binding"
    }
    roleRef = {
      apiGroup = "rbac.authorization.k8s.io"
      kind     = "ClusterRole"
      name     = "view"
    }
    subjects = [{
      kind     = "Group"
      name     = "read-only"
      apiGroup = "rbac.authorization.k8s.io"
    }]
  })
}
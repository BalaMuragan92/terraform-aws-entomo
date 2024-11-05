# Admin access policy
module "allow_eks_admin_access_iam_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "5.21.0"

  name          = "${var.environment}-allow-eks-admin-access"
  create_policy = true

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "eks:*",
        ]
        Effect   = "Allow"
        Resource = var.eks_cluster_arn
      },
    ]
  })
}

# Admin IAM role
module "eks_admin_iam_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "5.21.0"

  role_name         = "${var.environment}-admin"
  create_role       = true
  role_requires_mfa = false

  custom_role_policy_arns = [module.allow_eks_admin_access_iam_policy.arn]

  trusted_role_arns = [
    "arn:aws:iam::${var.vpc_owner_id}:root"
  ]
}

# Policy to assume admin role
module "allow_assume_eks_admins_iam_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "5.21.0"

  name          = "${var.environment}-allow-assume-eks-admin-role"
  create_policy = true

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sts:AssumeRole",
        ]
        Effect   = "Allow"
        Resource = module.eks_admin_iam_role.iam_role_arn
      },
    ]
  })
}

# Admin IAM group
module "eks_admins_iam_group" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"
  version = "5.21.0"

  name                              = "${var.environment}-admins"
  attach_iam_self_management_policy = false
  create_group                      = true
  custom_group_policy_arns          = [module.allow_assume_eks_admins_iam_policy.arn]
  group_users                       = var.admin_users
}

# Kubernetes RBAC configuration
resource "kubectl_manifest" "cluster_admins" {
  yaml_body = yamlencode({
    apiVersion = "rbac.authorization.k8s.io/v1"
    kind       = "ClusterRoleBinding"
    metadata = {
      name = "cluster-admins-binding"
    }
    roleRef = {
      apiGroup = "rbac.authorization.k8s.io"
      kind     = "ClusterRole"
      name     = "cluster-admin"
    }
    subjects = [{
      kind     = "Group"
      name     = "cluster-admins"
      apiGroup = "rbac.authorization.k8s.io"
    }]
  })
}
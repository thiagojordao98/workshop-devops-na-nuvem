resource "aws_eks_cluster" "this" {
  name                      = "workshop-march-eks-cluster"
  version                   = "1.31"
  role_arn                  = aws_iam_role.eks_cluster.arn
  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  access_config {
    authentication_mode = "API_AND_CONFIG_MAP"
  }

  vpc_config {
    subnet_ids = data.aws_subnets.private.ids
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_AmazonEKSClusterPolicy,
  ]
}

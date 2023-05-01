output "load_balancer_arn" {
    value = aws_iam_role.aws_load_balancer_controller.arn
}
output "cluster_autoscaller_arn" {
    value = aws_iam_role.eks_cluster_autoscaler.arn
  }

output "aws_load_balancer_controller_role_arn" {
  value = aws_iam_role.aws_load_balancer_controller.arn
}

output "eks_cluster_autoscaler_arn" {
  value = aws_iam_role.eks_cluster_autoscaler.arn
}
output "aws_efs_csi_controller_role_arn" {
  value = aws_iam_role.efs-csi-controller-sa.arn
}

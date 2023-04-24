data "aws_iam_policy_document" "efs-csi-controller-sa_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringEquals"
      variable = "${replace(var.opid_url, "https://", "")}:sub"
      values   = ["system:serviceaccount:kube-system:efs-csi-controller-sa"]
      #The SA to be created for Controller must be in kube-system namespace by the name efs-csi-controller-sa
    }

    principals {
      identifiers = [var.opid_arn]
      type        = "Federated"
    }
  }
}

resource "aws_iam_role" "efs-csi-controller-sa" {
  assume_role_policy = data.aws_iam_policy_document.efs-csi-controller-sa_assume_role_policy.json
  name               = "aws-efs-csi-controller"
}

resource "aws_iam_policy" "aws_efs_contoller" {
  policy = file("${path.module}/efs_controller_policy.json")
  name   = "aws-efs-csi-controller"
}

resource "aws_iam_role_policy_attachment" "aws_efs_csi_controller_attach" {
  role       = aws_iam_role.efs-csi-controller-sa.name
  policy_arn = aws_iam_policy.aws_efs_contoller.arn
}


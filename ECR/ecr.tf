resource "aws_ecr_repository" "eks-ecr" {
  name                 = "nginx-ecr"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
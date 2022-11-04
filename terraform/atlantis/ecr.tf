resource "aws_ecr_repository" "name" {
  name                 = "atlantis"
  image_tag_mutability = "MUTABLE"
}

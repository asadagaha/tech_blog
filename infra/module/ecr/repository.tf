resource "aws_ecr_repository" "frontend" {
  name                 = "${var.app}-front-${var.env}"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}
resource "aws_ecr_repository" "backend" {
  name                 = "${var.app}-back-${var.env}"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_db_subnet_group" "main" {
  name       = "${var.app}-db-subnet-group-${var.env}"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.app}-db-subnet-group-${var.env}"
  }
}
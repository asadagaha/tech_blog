resource "aws_rds_cluster_parameter_group" "main" {
  name   = "${var.app}-cluster-parameter-group-${var.env}"
  family = "aurora-postgresql${split(".", var.engine_version)[0]}"
}
resource "aws_db_parameter_group" "main" {
  name   = "${var.app}-db-parameter-group-${var.env}"
  family = "aurora-postgresql${split(".", var.engine_version)[0]}"
}
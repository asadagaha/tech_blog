resource "aws_rds_cluster" "main" {
  cluster_identifier = "${var.app}-db-cluster-${var.env}"
  engine             = "aurora-postgresql"
  engine_version     = var.engine_version
  engine_mode        = "provisioned"
  master_username    = var.username
  master_password    = var.password
  port               = 5432
  database_name      = var.app
  serverlessv2_scaling_configuration {
    max_capacity = 1.0
    min_capacity = 0.5
  }
  vpc_security_group_ids          = [var.rds_sg_id]
  db_subnet_group_name            = aws_db_subnet_group.main.name
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.main.name

  skip_final_snapshot = true
  apply_immediately   = true
}
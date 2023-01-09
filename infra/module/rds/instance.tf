resource "aws_rds_cluster_instance" "main" {
  cluster_identifier      = aws_rds_cluster.main.id
  identifier              = "${var.app}-db-instance-${var.env}"
  engine                  = aws_rds_cluster.main.engine
  engine_version          = aws_rds_cluster.main.engine_version
  instance_class          = "db.serverless"
  db_subnet_group_name    = aws_db_subnet_group.main.name
  db_parameter_group_name = aws_db_parameter_group.main.name

  #monitoring_role_arn = aws_iam_role.aurora_monitoring.arn
  #monitoring_interval = 60
}
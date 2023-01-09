resource "aws_security_group" "rds" {
  name        = "${var.app}-rds-sg-${var.env}"
  description = "${var.app}-rds-sg-${var.env}"
  vpc_id      = var.vpc_id
  tags = {
    Name = "${var.app}-rds-sg"
  }
}
resource "aws_security_group_rule" "rds_inbound_postgresql" {
  security_group_id        = aws_security_group.rds.id
  type                     = "ingress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.ecs.id
}

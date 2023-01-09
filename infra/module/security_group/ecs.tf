resource "aws_security_group" "ecs" {
  name        = "${var.app}-ecs-sg-${var.env}"
  description = "${var.app}-ecs-sg-${var.env}"
  vpc_id      = var.vpc_id
  tags = {
    Name = "${var.app}-ecs-sg"
  }
}
resource "aws_security_group_rule" "ecs_inbound_http" {
  security_group_id        = aws_security_group.ecs.id
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.alb.id
}
resource "aws_security_group_rule" "ecs_outbound_all_allow" {
  security_group_id = aws_security_group.ecs.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}
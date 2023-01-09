resource "aws_security_group" "alb" {
  name        = "${var.app}-alb-${var.env}"
  description = "${var.app} alb"
  vpc_id      = var.vpc_id
  tags = {
    Name = "${var.app}-alb-sg"
  }
}
resource "aws_security_group_rule" "alb_inbound_http" {
  security_group_id = aws_security_group.alb.id
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "alb_outbound_all_allow" {
  security_group_id = aws_security_group.alb.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

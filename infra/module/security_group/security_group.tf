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


resource "aws_security_group" "vpc_endpoint" {
  name        = "${var.app}-vpc-endpoint-sg-${var.env}"
  description = "${var.app}-vpc-endpoint-sg-${var.env}"
  vpc_id      = var.vpc_id
  tags = {
    Name = "${var.app}-vpc-endpoint-sg"
  }
}
resource "aws_security_group_rule" "vpc_endpoint_inbound_http" {
  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = [var.vpc_cidr]

  security_group_id = aws_security_group.vpc_endpoint.id
}
resource "aws_security_group_rule" "vpc_endpoint_outbound_all_allow" {
  security_group_id = aws_security_group.vpc_endpoint.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}
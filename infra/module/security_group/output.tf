output "ecs_sg_id" {
  value = aws_security_group.ecs.id
}
output "alb_sg_id" {
  value = aws_security_group.alb.id
}
output "vpc_endpoint_sg_id" {
  value = aws_security_group.vpc_endpoint.id
}
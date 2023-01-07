output "cloudwatch_log_group_for_ecs" {
  value = aws_cloudwatch_log_group.for_ecs.name
}

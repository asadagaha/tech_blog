output "ecs_task_execution_role_arn" {
  value = aws_iam_role.ecs_task_execution_role.arn
}
output "rds_monitoring_role_arn" {
  value = aws_iam_role.rds_monitoring_role.arn
}
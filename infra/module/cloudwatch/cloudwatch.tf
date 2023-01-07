resource "aws_cloudwatch_log_group" "for_ecs" {
  name              = "/${var.app}/${var.env}-for_ecs"
  retention_in_days = 180
}

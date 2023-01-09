resource "aws_iam_role" "ecs_task_execution_role" {
  name               = "${var.app}-ecs-task-role-${var.env}"
  assume_role_policy = data.aws_iam_policy_document.assume_role_for_ecs.json
}
data "aws_iam_policy_document" "assume_role_for_ecs" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}
resource "aws_iam_role_policy_attachment" "amazon_ecs_task_execution_role_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
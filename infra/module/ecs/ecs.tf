resource "aws_ecs_cluster" "main" {
  name = "${var.app}-cluster-${var.env}"
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}
resource "aws_ecs_cluster_capacity_providers" "main" {
  cluster_name       = aws_ecs_cluster.main.name
  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = "FARGATE"
  }
}

resource "aws_ecs_task_definition" "main" {
  family                   = "${var.app}-task-definition-${var.env}"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "awsvpc"
  execution_role_arn       = var.ecs_task_execution_role_arn
  task_role_arn            = var.ecs_task_execution_role_arn
  container_definitions = jsonencode([ #外部ファイルに外だししたい
    {
      "name" : "${var.app}-front-${var.env}"
      "image" : "${var.account_id}.dkr.ecr.${var.region}.amazonaws.com/${var.app}-front-${var.env}"
      "name" : "${var.app}-front-${var.env}",
      "essential" : true
      "portMappings" : [
        {
          "containerPort" : 80
          "hostPort" : 80
        }
      ]
      "logConfiguration" : {
        "logDriver" : "awslogs"
        "options" : {
          "awslogs-region" : var.region
          "awslogs-stream-prefix" : "ecs"
          "awslogs-group" : var.cloudwatch_log_group_for_ecs
        }
      }
    }
  ])
}

resource "aws_ecs_service" "main" {
  name            = "${var.app}-service-${var.env}"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.main.arn
  launch_type     = "FARGATE"

  desired_count = 1


  network_configuration {
    assign_public_ip = true
    subnets          = var.subnet_ids
    security_groups  = ["${var.ecs_sg_id}"]
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = "${var.app}-front-${var.env}"
    container_port   = "80"
  }
}
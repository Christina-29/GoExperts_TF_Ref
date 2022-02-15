
# This module usage starts here
resource "aws_ecs_cluster" "main" {
    name = "${var.prefix}-cluster"

    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_ecs_task_definition" "task" {
    family = "${var.prefix}-task"

    task_role_arn = "${var.ecs_task_role}"
    execution_role_arn  = "${var.ecs_task_role}"

    container_definitions = templatefile("${path.module}/templates/container_definitions_ec2_dynamic.tpl", {
        name   = "${var.prefix}-cont"
        cpu    = 128
        memory = 450
        image  = "${var.image}"
        environmentFiles    = "${var.environment_file_path}"
        container_port      = "${var.container_port}"
    })
}

resource "aws_ecs_service" "service" {
    name            = "${var.prefix}-service"
    cluster         = aws_ecs_cluster.main.id
    task_definition = aws_ecs_task_definition.task.arn
    desired_count   = 1

    load_balancer {
        target_group_arn = module.alb.target_group_arns[0]
        container_name   = "${var.prefix}-cont"
        container_port   = "${var.container_port}"
    }

    force_new_deployment                = true
    health_check_grace_period_seconds   = 120
}

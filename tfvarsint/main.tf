
variable "aws_region" {
  description = "Region for the VPC"
  default = "ap-south-1"
}


resource "aws_ecs_service" "ecsservice" {
  name            = "${var.sia_name}_${var.sia_cat}_service"
  cluster         = "JNR-INT"
  #task_definition = "${aws_ecs_task_definition.adroitbackend.arn}"
  task_definition = "${aws_ecs_task_definition.ecstaskdefinition.family}:${max("${aws_ecs_task_definition.ecstaskdefinition.revision}")}"
  desired_count   = 1
  load_balancer {
    
    target_group_arn = "${var.container_target_group_arn}"
    container_name   = "${var.sia_name}_${var.sia_cat}_container"
    container_port   = "${var.container_port}"
  } 
  
}

resource "aws_ecs_task_definition" "ecstaskdefinition" {
  family = "${var.sia_name}_${var.sia_cat}_taskdefinition"

  container_definitions = <<EOF
[
  {
    "portMappings": [
      {
        "hostPort": ${var.container_host_port},
        "protocol": "tcp",
        "containerPort": ${var.container_port}
      }
    ],
    "cpu": ${var.container_cpu_limit},
    "memory": ${var.conatiner_memory_limit},
    "image": "${var.ecr_url}:${var.sia_name}_${var.sia_cat}_${var.imageversion}",
    "essential": true,
    "name": "${var.sia_name}_${var.sia_cat}_container"
	
  }
]
EOF
}
# AUTOSCALING GROUP  AUTOSCALING GROUP  AUTOSCALING GROUP  AUTOSCALING GROUP  AUTOSCALING GROUP  AUTOSCALING GROUP  AUTOSCALING GROUP
resource "aws_autoscaling_group" "web" {
  name = var.autoscaling_name

  min_size             = 1
  desired_capacity     = 1
  max_size             = 2
  health_check_grace_period = 300
  health_check_type    = "ELB"
  load_balancers = [
    aws_elb.web_elb.id
  ]

  launch_configuration = aws_launch_configuration.web.name

  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"
  ]

  metrics_granularity = "1Minute"

  vpc_zone_identifier  = [
    aws_subnet.public_us_east_1a.id,
    aws_subnet.public_us_east_1b.id
  ]

  # Required to redeploy without an outage.
  lifecycle {
    create_before_destroy = true
  }

    tags = concat(
    [
      {
        "key"                 = "createdby"
        "value"               = "gastonFreire"
        "propagate_at_launch" = true
      },
      {
        "key"                 = "project"
        "value"               = "training"
        "propagate_at_launch" = true
      },
      {
        "key"                 = "environment"
        "value"               = var.ec2_tag_environment
        "propagate_at_launch" = true
      },
    ],
    )
}
# AUTO.GROUP POLICY Up
resource "aws_autoscaling_policy" "web_policy_up" {
  name = var.autoscaling_policy_up
  scaling_adjustment = 1
  adjustment_type = "ChangeInCapacity"
  cooldown = 120
  autoscaling_group_name = aws_autoscaling_group.web.name
}

# AUTO.GROUP POLICY Down
resource "aws_autoscaling_policy" "web_policy_down" {
  name = var.autoscaling_policy_down
  scaling_adjustment = -1
  adjustment_type = "ChangeInCapacity"
  cooldown = 120
  autoscaling_group_name = aws_autoscaling_group.web.name
}

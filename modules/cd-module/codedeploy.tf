resource "aws_codedeploy_app" "cd-gf" {
  compute_platform = "Server"
  name             = var.codedeploy_name
}

resource "aws_codedeploy_deployment_config" "cd-deployconf-gf" {
  deployment_config_name = var.deploymentgroup_config_name

  minimum_healthy_hosts {
    type  = "HOST_COUNT"
    value = 1
  }
}

resource "aws_iam_role" "rolegfcd" {
  name = var.deploymentgroup_role_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service":  [
          "codedeploy.amazonaws.com",
          "ec2.amazonaws.com"
        ]
        },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "AWSCodeDeployRole" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
  role       = aws_iam_role.rolegfcd.name
}

resource "aws_codedeploy_deployment_group" "gf-group" {
  app_name              = aws_codedeploy_app.cd-gf.name
  deployment_group_name = var.deploymentgroup_name
  service_role_arn      = aws_iam_role.rolegfcd.arn
  autoscaling_groups    = [ var.autoscaling_id ]

/*   ec2_tag_set {
    ec2_tag_filter {
      key   = "environment"
      type  = "KEY_AND_VALUE"
      value = var.ec2_tag_environment
    }
  } */

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }

/*   alarm_configuration {
    alarms  = ["my-alarm-name"]
    enabled = true
  } */
}
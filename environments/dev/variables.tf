##############################
# S3 Bucket name
##############################
variable "s3_name" {}

##############################
# Common tags
##############################
variable "createdby" {}
variable "project" {}

##############################
# GitHub Branch name
##############################
variable "gh-branch" {}

##############################
# CodePipeline
##############################
variable "cp_name" {}
variable "iam_name" {}

##############################
# CloudFront
##############################
variable "cf_comment" {}

##############################
# Autoscaling Group
##############################
    ##############################
    # Alarm
    ##############################
    variable "cpu_alarm_up" {}
    variable "cpu_alarm_down" {}

    ##############################
    # Autoscaling
    ##############################
    variable "autoscaling_name" {}
    variable "autoscaling_policy_up" {}
    variable "autoscaling_policy_down" {}

    ##############################
    # IAM Role
    ##############################
    variable "ec2_policy_name" {}
    variable "ec2_role_name" {}
    variable "ec2_profile_name" {}

    ##############################
    # InternetGateway
    ##############################
    variable "ig_name" {}

    ##############################
    # Launch Config
    ##############################
    variable "ec2_name" {}
    variable "ec2_tag_environment" {}

    ##############################
    # Loadbalancer
    ##############################
    variable "loadbalancer_name" {}

    ##############################
    # Security Group
    ##############################
    variable "sg_ec2_name" {}
    variable "sg_elb_name" {}

##############################
# CodeDeploy
##############################
variable "codedeploy_name" {}
variable "deploymentgroup_config_name" {}
variable "deploymentgroup_role_name" {}
variable "deploymentgroup_name" {}
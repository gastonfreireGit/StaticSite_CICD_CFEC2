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
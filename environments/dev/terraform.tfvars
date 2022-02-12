##############################
# S3 Bucket name
##############################
s3_name = "staticsite-dev-gf"

##############################
# Common tags
##############################
createdby = "gastonFreire"
project   = "training"

##############################
# GitHub Branch name
##############################
gh-branch = "static-site-dev"

##############################
# CodePipeline
##############################
cp_name  = "cp-staticsite-gf-dev"
iam_name = "role-staticsite-gf-dev"

##############################
# CodePipeline
##############################
cf_comment = "StaticSite-GF-CF-Dev"

##############################
# Autoscaling Group
##############################
    ##############################
    # Alarm
    ##############################
    cpu_alarm_up = "alarm-up-gf-dev"
    cpu_alarm_down = "alarm-down-gf-dev"

    ##############################
    # Autoscaling
    ##############################
    autoscaling_name = "asg-gf-dev"
    autoscaling_policy_up = "asg-policy-gf-up-dev"
    autoscaling_policy_down = "asg-policy-gf-down-dev"

    ##############################
    # IAM Role
    ##############################
    ec2_policy_name = "ec2-policy-gf-dev"
    ec2_role_name = "ec2-role-gf-dev"
    ec2_profile_name = "ec2-profile-gf-dev"

    ##############################
    # InternetGateway
    ##############################
    ig_name = "ig-gf-dev"

    ##############################
    # Launch Config
    ##############################
    ec2_name = "ec2-gf-dev"
    ec2_tag_environment = "devgf"

    ##############################
    # Loadbalancer
    ##############################
    loadbalancer_name = "elb-gf-dev"

    ##############################
    # Security Group
    ##############################
    sg_ec2_name = "ec2-sg-gf-dev"
    sg_elb_name = "elb-sg-gf-dev"

##############################
# CodeDeploy
##############################
codedeploy_name = "codedeploy-gf-dev"
deploymentgroup_config_name = "deploymentg-config-gf-dev"
deploymentgroup_role_name = "deploymentg-role-gf-dev"
deploymentgroup_name = "deploymentg-gf-dev"
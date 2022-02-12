####################
# S3 Bucket name
####################
s3_name = "staticsite-prod-gf"

####################
# Common tags
####################
createdby = "gastonFreire"
project   = "training"

####################
# GitHub Branch name
####################
gh-branch = "main"

####################
# CodePipeline
####################
cp_name  = "cp-staticsite-gf-prod"
iam_name = "role-staticsite-gf-prod"

####################
# CodePipeline
####################
cf_comment = "StaticSite-GF-CF-Prod"

##############################
# Autoscaling Group
##############################
    ##############################
    # Alarm
    ##############################
    cpu_alarm_up = "alarm-up-gf-prod"
    cpu_alarm_down = "alarm-down-gf-prod"

    ##############################
    # Autoscaling
    ##############################
    autoscaling_name = "asg-gf-prod"
    autoscaling_policy_up = "asg-policy-gf-up-prod"
    autoscaling_policy_down = "asg-policy-gf-down-prod"

    ##############################
    # IAM Role
    ##############################
    ec2_policy_name = "ec2-policy-gf-prod"
    ec2_role_name = "ec2-role-gf-prod"
    ec2_profile_name = "ec2-profile-gf-prod"

    ##############################
    # InternetGateway
    ##############################
    ig_name = "ig-gf-prod"

    ##############################
    # Launch Config
    ##############################
    ec2_name = "ec2-gf-prod"
    ec2_tag_environment = "prodgf"

    ##############################
    # Loadbalancer
    ##############################
    loadbalancer_name = "elb-gf-prod"

    ##############################
    # Security Group
    ##############################
    sg_ec2_name = "ec2-sg-gf-prod"
    sg_elb_name = "elb-sg-gf-prod"

##############################
# CodeDeploy
##############################
codedeploy_name = "codedeploy-gf-prod"
deploymentgroup_config_name = "deploymentg-config-gf-prod"
deploymentgroup_role_name = "deploymentg-role-gf-prod"
deploymentgroup_name = "deploymentg-gf-prod"
##############################
# S3 Bucket name
##############################
s3_name = "staticsite-test-gf"

##############################
# Common tags
##############################
createdby = "gastonFreire"
project   = "training"

##############################
# GitHub Branch name
##############################
gh-branch = "static-site-test"

##############################
# CodePipeline
##############################
cp_name  = "cp-staticsite-gf-test"
iam_name = "role-staticsite-gf-test"

##############################
# CodePipeline
##############################
cf_comment = "StaticSite-GF-CF-Test"

##############################
# Autoscaling Group
##############################
    ##############################
    # Alarm
    ##############################
    cpu_alarm_up = "alarm-up-gf-test"
    cpu_alarm_down = "alarm-up-gf-test"

    ##############################
    # Autoscaling
    ##############################
    autoscaling_name = "asg-gf-test"
    autoscaling_policy_up = "asg-policy-gf-up-test"
    autoscaling_policy_down = "asg-policy-gf-down-test"

    ##############################
    # IAM Role
    ##############################
    ec2_policy_name = "ec2-policy-gf-test"
    ec2_role_name = "ec2-role-gf-test"
    ec2_profile_name = "ec2-profile-gf-test"

    ##############################
    # InternetGateway
    ##############################
    ig_name = "ig-gf-test"

    ##############################
    # Launch Config
    ##############################
    ec2_name = "ec2-gf-test"
    ec2_tag_environment = "testgf"

    ##############################
    # Loadbalancer
    ##############################
    loadbalancer_name = "elb-gf-test"

    ##############################
    # Security Group
    ##############################
    sg_ec2_name = "ec2-sg-gf-test"
    sg_elb_name = "elb-sg-gf-test"

##############################
# CodeDeploy
##############################
codedeploy_name = "codedeploy-gf-test"
deploymentgroup_config_name = "deploymentg-config-gf-test"
deploymentgroup_role_name = "deploymentg-role-gf-test"
deploymentgroup_name = "deploymentg-gf-test"
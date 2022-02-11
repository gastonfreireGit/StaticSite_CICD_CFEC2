terraform {
  backend "s3" {
    bucket = "tf-backend-staticsite-gf"
    key    = "environments/test/terraform.tfstate"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      createdby = var.createdby
      project   = var.project
    }
  }
}

module "s3_module" {
  source  = "../../modules/s3-module"
  s3_name = var.s3_name
}

module "autoscaling_module" {
  source = "../../modules/autoscaling-module"
  cpu_alarm_up = var.cpu_alarm_up
  cpu_alarm_down = var.cpu_alarm_down
  autoscaling_name = var.autoscaling_name
  autoscaling_policy_up = var.autoscaling_policy_up
  autoscaling_policy_down = var.autoscaling_policy_down
  ec2_policy_name = var.ec2_policy_name
  ec2_role_name = var.ec2_role_name
  ec2_profile_name = var.ec2_profile_name
  ig_name = var.ig_name
  ec2_name = var.ec2_name
  ec2_tag_environment = var.ec2_tag_environment
  loadbalancer_name = var.loadbalancer_name
  sg_ec2_name = var.sg_ec2_name
  sg_elb_name = var.sg_elb_name

}

module "cf_module" {
  source     = "../../modules/cf-module"
  s3_name    = var.s3_name
  cf_comment = var.cf_comment
  ec2_origin = module.autoscaling_module.elb_dns_name
  depends_on = [
    module.autoscaling_module
  ]
}

module "cp_module" {
  source    = "../../modules/cp-module"
  s3_name   = var.s3_name
  gh-branch = var.gh-branch
  iam_name  = var.iam_name
  cp_name   = var.cp_name
  codedeploy_name = var.codedeploy_name
  deploymentgroup_name = var.deploymentgroup_name
  depends_on = [
    module.cf_module
  ]
}

module "cd_module" {
  source    = "../../modules/cd-module"
  createdby = var.createdby
  project   = var.project
  codedeploy_name = var.codedeploy_name
  deploymentgroup_config_name = var.deploymentgroup_config_name
  deploymentgroup_role_name = var.deploymentgroup_role_name
  deploymentgroup_name = var.deploymentgroup_name
  ec2_tag_environment = var.ec2_tag_environment
    depends_on = [
    module.cp_module
  ]
}
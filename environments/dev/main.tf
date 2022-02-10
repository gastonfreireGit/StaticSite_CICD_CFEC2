terraform {
  backend "s3" {
    bucket = "tf-backend-staticsite-gf"
    key    = "environments/dev/terraform.tfstate"
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

module "ec2_module" {
  source = "../../modules/ec2-module"
}

module "cf_module" {
  source     = "../../modules/cf-module"
  s3_name    = var.s3_name
  cf_comment = var.cf_comment
  ec2_origin = module.ec2_module.elb_dns_name
  depends_on = [
    module.ec2_module
  ]
}

module "cp_module" {
  source    = "../../modules/cp-module"
  s3_name   = var.s3_name
  gh-branch = var.gh-branch
  iam_name  = var.iam_name
  cp_name   = var.cp_name
  depends_on = [
    module.cf_module
  ]
}

module "cd_module" {
  source    = "../../modules/cd-module"
  createdby = var.createdby
  project   = var.project
}
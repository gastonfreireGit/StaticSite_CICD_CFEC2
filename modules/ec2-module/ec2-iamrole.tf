terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_role_policy" "ec2_policy" {
  name        = "ec2_policy"
  role        = aws_iam_role.EC2staticsiteGF_role.name
  policy = jsonencode({
"Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "s3:GetObject",
                "s3:GetObjectVersion",
                "s3:ListBucket"
            ],
            "Effect": "Allow",
            "Resource": "*"
        }
    ]
  })
}

resource "aws_iam_role" "EC2staticsiteGF_role" {  

  name = "EC2staticsiteGF"

  tags = {
    createdby = "gastonFreire"
    project = "training"
}

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name  = "EC2staticsiteGF_profile"
  role = aws_iam_role.EC2staticsiteGF_role.name
}
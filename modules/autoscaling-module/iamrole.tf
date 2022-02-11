resource "aws_iam_role_policy" "ec2_policy" {
  name        = var.ec2_policy_name
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

  name = var.ec2_role_name

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
  name  = var.ec2_profile_name
  role = aws_iam_role.EC2staticsiteGF_role.name
}
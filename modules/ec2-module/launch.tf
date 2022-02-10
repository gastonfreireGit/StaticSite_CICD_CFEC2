# LAUNCH CONFIGURATION  LAUNCH CONFIGURATION  LAUNCH CONFIGURATION  LAUNCH CONFIGURATION  LAUNCH CONFIGURATION  LAUNCH CONFIGURATION  
resource "aws_launch_configuration" "web" {
  name_prefix = "web-gf-"

  image_id      = "ami-04505e74c0741db8d" #"ami-0947d2ba12ee1ff75" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t2.micro"
  key_name = "staticsite-gf-kp"
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  security_groups             = [aws_security_group.allow_http.id]
  associate_public_ip_address = true

  user_data = <<-EOF
                #! /bin/bash
                sudo -i
                sudo apt-get update
                sudo apt install apache2 -y
                sudo service apache2 start
                sudo apt install ruby-full -y
                sudo apt install wget
                cd /home/ubuntu
                wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
                chmod +x ./install
                sudo ./install auto > /tmp/logfile
                sudo service codedeploy-agent start
                sudo rm /var/www/html/index.html
                
                EOF

  lifecycle {
    create_before_destroy = true
  }

}
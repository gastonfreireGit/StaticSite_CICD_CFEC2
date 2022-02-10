/* resource "aws_vpc" "main" {
  cidr_block       = "15.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  
  tags = {
    Name = "staticsite-vpc-gf"
    createdby = "gastonFreire"
    project = "training"
  }
}
 */

# VPC  VPC  VPC  VPC  VPC  VPC  VPC  VPC  VPC  VPC  VPC  VPC VPC  VPC  VPC  VPC  VPC  VPC  VPC 
resource "aws_vpc" "my_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "My VPC GF"
  }
}

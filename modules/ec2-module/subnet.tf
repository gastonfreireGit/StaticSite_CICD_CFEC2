/* data "aws_availability_zones" "azs" {
  state = "available"
}

resource "aws_subnet" "example1" {
 availability_zone = element(data.aws_availability_zones.azs.names, 0)
  vpc_id            = aws_vpc.main.id
  cidr_block        = "15.0.1.0/28"
  tags = {
    Name = "staticsite-subnet1-gf"
    createdby = "gastonFreire"
    project = "training"
  }
}

resource "aws_subnet" "example2" {
 availability_zone = element(data.aws_availability_zones.azs.names, 0)
  vpc_id            = aws_vpc.main.id
  cidr_block        = "15.0.2.0/28"
  tags = {
    Name = "staticsite-subnet2-gf"
    createdby = "gastonFreire"
    project = "training"
  }
} */



# SUBNET SUBNET SUBNET SUBNET SUBNET SUBNET SUBNET SUBNET SUBNET SUBNET SUBNET SUBNET SUBNET 
resource "aws_subnet" "public_us_east_1a" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Public Subnet us-east-1a"
  }
}

resource "aws_subnet" "public_us_east_1b" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Public Subnet us-east-1b"
  }
}

# INTERNET GATEWAY INTERNET GATEWAY INTERNET GATEWAY INTERNET GATEWAY INTERNET GATEWAY INTERNET GATEWAY
resource "aws_internet_gateway" "my_vpc_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = var.ig_name
  }
}

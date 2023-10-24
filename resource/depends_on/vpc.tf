#Create VPC
#Create Subnet
#Create Internet Gateway
#Create Route Table
#Create Route in Route Table for Internet Access
#Associate Route Table with Subnet
#Create Security Group in the VPC with port 80, 22 as inbound open
#Create EC2 Instance in respective new vpc, new subnet created above with a static key pair, associate Security group created earlier
#Create Elastic IP Address and Associate to EC2 Instance
#Use depends_on Resource Meta-Argument attribute when creating Elastic IP

# terraform block
# provider Block
# resource 

resource "aws_vpc" "vpc-dev" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "name" = "vpc-dev"
  }

}

resource "aws_subnet" "vpc-dev-public-subnet-1" {
  vpc_id                  = aws_vpc.vpc-dev.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true


}

resource "aws_internet_gateway" "vpc-dev-igw" {
  vpc_id = aws_vpc.vpc-dev.id

}

resource "aws_route_table" "vpc-dev-public-route-table" {
  vpc_id = aws_vpc.vpc-dev.id

}

resource "aws_route" "vpc-dev-public-route" {
  route_table_id         = aws_route_table.vpc-dev-public-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc-dev-igw.id

}

resource "aws_route_table_association" "vpc-dev-public-route-table-associate" {
  route_table_id = aws_route_table.vpc-dev-public-route-table.id
  subnet_id      = aws_subnet.vpc-dev-public-subnet-1.id

}

resource "aws_security_group" "dev-vpc-sg" {
  name        = "dev-vpc-default-sg"
  vpc_id      = aws_vpc.vpc-dev.id
  description = " my sg created with Tf"

  ingress {

    description = " i am allowing port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {

    description = " i am allowing port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {

    description = "openinh all ports"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

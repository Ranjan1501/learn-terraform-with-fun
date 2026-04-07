locals {
  public_subnets = {
    for key , config in var.subnet_config : key => config if config.public
  }
}

data "aws_availability_zones" "available" {
    state = "available"
}


resource "aws_subnet" "public " {
    for_each = local.public_subnets
    vpc_id = aws_vpc.main.id
    cidr_block = each.value.cidr_block
    availability_zone = each.value.availability_zone
    map_public_ip_on_launch = true
    lifecycle {
      
    }
}
resource "aws_vpc" "main" {
  cidr_block = "0.0.0/16"
}
resource "aws_internet_gateway" "gtw" {
    count = length (local.public_subnets) > 0 ? 1 : 0 # if there are public subnets then create internet gateway
    vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "public_rtb" {
  count = length (local.public_subnets) > 0 ? 1 : 0 # if there are public subnets then create route table
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gtw[0].id
  }
}


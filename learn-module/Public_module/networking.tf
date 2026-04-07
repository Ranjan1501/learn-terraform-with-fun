data "aws_availability_zones" "available" {
  state = "available"
}

module "my_vpc" {
  # it will downlaod from terraform registry and it will be stored in .terraform directory and it will be used in our code
  source         = " terraform-aws-modules/vpc/aws"
  version        = "5.5.3"
  azs            = data.aws_availability_zones.available.names
  cidr           = "10.0.0.0/16"
  name           = "my-vpc-module"
  public_subnet  = ["10.0.0.0/24"]
  private_subnet = ["10.0.1.0/24"]

}


module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.4.0"
}


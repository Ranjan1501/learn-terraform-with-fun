data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["30330003"] # randomenly picking an owner id, you can use your own or use "amazon" for official AMIs
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {

}
data "aws_availability_zone" "azs" {
  name = var.availability_zone
}
locals {
  allowed_instance_type = ["t2.micro", "t3.micro"]
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp3"
  }
  lifecycle {
    precondition {
      condition     = contains(local.allowed_instance_type, var.instance_type)
      error_message = "This is an invalid instance type. Please use t2.micro"
    } 
    # as the value is passed with default value of t2.micro, this precondition will not fail, but if you change the default value to something else, it will fail with the error message specified above.
    postcondition {
      condition = contains(local.allowed_instance_type, self.instance_type)
      error_message = "The instance type was not set to t2.micro or t3.micro as expected"

    }
    # add a faling condtion
    postcondition {
      condition = self.availability_zone == "eu-central-1a"
      error_message = "wrong availablity zone passed"
    }
  
  }
  tags = {
    Name   = "web-server"
    Owner  = data.aws_caller_identity.current.account_id
    Region = data.aws_region.current.name
  }
}

  check "cost_center_check" {
     assert {
        condition = can(aws_instance.web.tags.CostCenter != null)
        # error_message = "CostCenter tag is missing"
        error_message = <<-EOT
          CostCenter tag is missing. Please add a CostCenter tag to the instance with a valid value.
        EOT
     }
    }


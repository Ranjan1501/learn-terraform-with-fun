locals {
  first_name_from_object_list = var.object_list[*].first_name
  full_name_from_object_list  = var.object_list[*].first_name + " " + var.object_list[*].last_name
}

# it is way to access the value from the list of object using splat operator and it will return the list of first name and full name from the object list instead of for loop this can be used with list only 


locals {
  versioning_enabled = environment == "production" && bucket_name == "backup" ? true : false
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
  versioning {
    enabled = local.versioning_enabled
  }
}

resource "aws_subnet" "subnet" {
  count = var.environment == "prod" ? 3 : 1

  vpc_id     = aws_vpc.example.id
  cidr_block = cidrsubnet(aws_vpc.example.cidr_block, 8, count.index)
}
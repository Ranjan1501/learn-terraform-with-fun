variable "region" {
  description = "name of the region"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "name of the bucket"
  type        = string
  default     = "my-unique-bucket-name-1234567890"
}

// validation on ec2 instance type
variable "ec2_instance_type" {
  description = "type of the ec2 instance"
  type        = string
  validation {
    # condition     = contains(["t2.micro", "t2.small", "t2.medium"], var.ec2_instance_type) or 
    condition     = var.ec2_instance_type == "t2.micro" || var.ec2_instance_type == "t2.small" || var.ec2_instance_type == "t2.medium"
    error_message = "ec2 instance type must be one of t2.micro, t2.small, t2.medium"
  }
}

variable "ec2_instance_config" {
  sensitive = true
  type = object({
    instance_type = string
    ami           = string
    size          = number
  })
  default = {
    ami           = "value"
    instance_type = "gp3"
    size          = 10
  }
}

variable "additional_tags" {
  type    = map(string)
  default = {}
}

variable "number_list" {
  type = list(number)
  description = "list of numbers"
}

variable "object_list" {
  type = list(object({
    first_name = string
    last_name = string
    age  = number
  }))
  description = "list of objects with name and age"
}

variable "numbers_map" {
  type = map(number)
  description = "map of numbers"
}
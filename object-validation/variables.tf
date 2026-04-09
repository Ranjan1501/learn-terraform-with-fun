variable "region" {
  type        = string
  description = "The AWS region to create resources in"
  default     = "us-east-1"
}

variable "instance_type" {
  type = string
  default = "t2.micro"

}
variable "availability_zone" {
  type = string
  default = "us-east-1a"
}
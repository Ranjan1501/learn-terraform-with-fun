variable "subnet_config" {
  type = map(object({
    cidr_block = string
    availability_zone = string
    public = bool
  }))
  description = "public subnet for vpc"
}

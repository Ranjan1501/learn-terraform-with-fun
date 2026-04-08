output "vpc_id" {
  value = module.vpc.id
}

output "public_subnet_ids" {
    description = "The Id of the public subnets"
  value = module.vpc.public_subnet
}

output "private_subnet_ids" {
    description = "The Id of the private subnets"
  value = module.vpc.private_subnet
}
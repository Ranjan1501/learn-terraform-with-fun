ec2_instance_type = “t2.micro” 
ec2_instance_config = {
ami = "value"
Size = 10
Type = “gp2”
}


additional_tags = {
	valueFrom = “terraform.tfvars” 
}


// how to pass variables to terraform apply command
// terraform apply -var-file="vars/dev.tfvars"


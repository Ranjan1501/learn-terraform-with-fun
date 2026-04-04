ec2_instance_type = "t2.micro" 
ec2_instance_config = {
ami = "value"
Size = 10
Type = "gp2"
}


additional_tags = {
	valueFrom = "terraform" 
}


// how to pass variables to terraform apply command
// terraform apply -var-file="vars/dev.tfvars"


nummber_list = [1, 2, 3, 4, 5]

object_list = [
  {
	first_name = "John"
	last_name = "Doe"
	age  = 30
  },
  {
	first_name = "Jane"
	last_name = "Smith"
	age  = 25
  },
  {
	first_name = "Bob"
	last_name = "Johnson"
	age  = 40
  }
]

numbers_map = {
  one = 1
  two = 2
  three = 3
  four = 4
  five = 5
}
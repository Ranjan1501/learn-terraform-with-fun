## Design a seperate networking module with terraform: 

A networking module that should have 
Create a VPC with given CIDR block 
Allow user to provide the configuration for multiple subnets:
 The user should  be able to provide CIDR blocks
The user should be able to provide AWS AZs
The user should able to mark a subnet as public or private 
If at least one subnet is public , we need to deploy an IGW. 
We need to associate the public subnets with a public RTB (Route Table)



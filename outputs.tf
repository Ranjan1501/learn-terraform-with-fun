output "ec2_instance_config" {
  sensitive   = true
  value       = var.ec2_instance_config
  description = "configuration for the ec2 instance"

}
# how to load config yml file in terraform which contains user role. 


locals {
  user_from_yaml = yamldecode(file("${path.module}/user-roles.yaml")).users
}


output "users" {
  value = local.user_from_yaml
}

# here note use aws_iam_user_login_profile.users l create to fetch the password for each user 

output "password" {
   value = { for uers, user_login in aws_iam_user_login_profile.users :user => user_login.password}
}
resource "aws_iam_user" "users" {
  for_each = local.user_from_yaml[*].username 

  name = each.value.username
}




resource "aws_iam_user" "users" {
  for_each = aws_iam_user.users
  name = each.value.name
  password_length = 12

  lifecycle {
    ignore_changes = [ 
      password_length, 
      password_reset_required,
      pgp_key
     ]
  }

  
}
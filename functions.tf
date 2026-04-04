# doc link https://developer.hashicorp.com/terraform/language/functions/templatefile


locals {
  namse = "lauro miller"
  age = 15
}

output "name_upper" {
  value = upper(local.namse)
}

output "startWith" {
  value = startswith(lower(local.namse), "lauro")
}


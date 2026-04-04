# for expression
# Syntax: [ for <item> in <list> : what operation want to  ]  [] is required the value will be concatenated to the list

locals {
  doubles_numbers = [ for num in var.number_list :   num * 2 ]
  # checke even number and add it to the list : pick  num  if condition/filter  if num % 2 == 0 mathces then add to the list 
  even_numbers = [ for num in var.number_list : num if num % 2 == 0]
  first_name = [ for obj in var.object_list : obj.first_name ]
  full_name = [ for obj in var.object_list : "${obj.first_name} ${obj.last_name}" ]

  # : key this will return all the key 
  # if you want value to be returned then use : value this will return all the value of the map
  # => arrow is used to specify the key and value in the map
  even_occurances_map = { for key , value in var.numbers_map : key => value if value % 2 == 0 }
}

# Experssion with maps 

 # Note while working with object we use [] to store but with map we use {} to store the value and we need to specify the key and value in the map this is core physical difference between object and map in terraform but in map does not fixed strucutre of key and value but in object we need to specify the key and value in the object and we can not add any other key and value in the object but in map we can add any key and value in the map this is core  difference between object and map in terraform
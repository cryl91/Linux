#.tfvars files are used to define variables and their values separately from your main .tf configuration files. 
#This helps keep your code clean, modular, and reusable.
#Create variable file -> change the variables according to dev or prod in tfvars files -> terraform apply -var-file="dev.tfvar"
resource "aws_instance" "myinstance" {
   ami                     = var.ami_id
   instance_type           = var.instances  
   
   tags = var.tags
 } 

 output "aws_instance_info" { 
   value = aws_instance.myinstance
 }

# resource "aws_route53_record" "record" {
#   for_each = aws_instance.instances #You can give like this also
#   zone_id = #give hosted zone id
#   name    = "${var.instance_name[count.index]}.joindevops.online" #interpolation ie fixed value "joindevops.online" is combined with variable
#   type    = "A"
#   ttl     = 1
#   records = [ each.key == "web" ? each.value.public_ip : each.value.private_ip ]
# }
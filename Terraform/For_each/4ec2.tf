resource "aws_instance" "myinstance" {
   for_each = var.instances
   ami                     = var.ami_id
   instance_type           = each.key  
   tags = {
      name = each.value
   }
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
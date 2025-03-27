# resource "aws_instance" "myinstance" {
#   ami                     = "ami-08b5b3a93ed654d19"
#   instance_type           = "t2.micro"
# }

resource "aws_instance" "myinstance" {
   for_each = var.instances
   ami                     = var.ami_id
   instance_type           = each.key  
   tags = {
      name = each.value
   }
 } 
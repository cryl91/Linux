resource "aws_instance" "myinstance" {
   ami                     = var.ami_id
   instance_type           = var.instance_type 
 } 

output "pub_ip" {
  value = aws_instance.myinstance.public_ip
}
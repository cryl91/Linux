output "public_ip" {
  value = aws_instance.myinstance.public_ip
}

output "private_ip"{
  value = aws_instance.myinstance.private_ip
}
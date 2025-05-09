resource "aws_security_group" "sg_alb" {
  name = "sg_alb"
  description = "allowing all"
  
  ingress {
    description = "from vpc"
    from_port = 0
    to_port   = 0
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"  #all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
} 

output "sg" {
  value = aws_security_group.sg_alb.id
}
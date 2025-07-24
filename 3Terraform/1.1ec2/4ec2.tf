resource "aws_instance" "myinstance" {
  ami                     = "ami-08b5b3a93ed654d19"
  instance_type           = "t2.micro"
    tags = {
      Name = "mongodb" #Use capital "N" in name to give name to ec2 instance
      Envirnoment = "dev"
    }
     } 
     
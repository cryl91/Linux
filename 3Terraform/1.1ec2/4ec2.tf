resource "aws_instance" "myinstance" {
  ami                     = "ami-08b5b3a93ed654d19"
  instance_type           = "t2.micro"
  user_data = file("install.sh") //Reads the shell script (install.sh) and passes it as user data and the script runs on the EC2 instance at launch. This is used inside an aws_instance resource. 

   provisioner "local-exec" {
    command = "echo ${self.private_ip} > file1"
  } 
    tags = {
      Name = "mongodb" #Use capital "N" in name to give name to ec2 instance
      Envirnoment = "dev"
    }
     } 
     
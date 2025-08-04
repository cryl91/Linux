resource "aws_key_pair" "generated" {
  key_name   = "lock"
  public_key = file("lock.pub")
}

resource "aws_instance" "myinstance" {
  ami                     = "ami-08b5b3a93ed654d19"
  instance_type           = "t2.micro"
  key_name      = aws_key_pair.generated.key_name
  associate_public_ip_address = true
  user_data = file("install.sh") //Reads the shell script (install.sh) and passes it as user data and the script runs on the EC2 instance at launch. This is used inside an aws_instance resource. 
  //User_data is a predefined argument in the aws_instance resource. You must use the user_data argument specifically when provisioning AWS EC2 instances via Terraform if you want that script (install.sh) to run on instance launch
  //In Terraform, the file() function reads the entire contents of a file from your local machine and returns it as a string.
   provisioner "local-exec" {
    command = "echo ${self.private_ip} > file1"
  } 
    tags = {
      Name = "mongodb" #Use capital "N" in name to give name to ec2 instance
      Envirnoment = "dev"
    }
     } 

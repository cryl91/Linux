module "ec21_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "ec21"  
  ami = data.aws_ami.ami.id
  instance_type          = "t2.micro"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
# resource "aws_instance" "catalogue" {
#   ami                     = "ami-08b5b3a93ed654d19"
#   instance_type           = "t2.micro"
# }

resource "aws_key_pair" "generated" {
  key_name   = "Terraform"
  public_key = file("terraform.pub")
}


resource "aws_instance" "catalogue" {
   ami                     = var.ami_id
   instance_type           = var.instance_type
   key_name      = aws_key_pair.generated.key_name
  
  
   #instance_type = data.aws_ssm_parameter.instance_type.value #to use the parameter store value 

    # tags = {
    #   name = "mongodb"
    #   Envirnoment = "dev"
    # }

    user_data = file("catalogue.sh") //use this or below null resource and remote provisioner
    tags = var.tags
 } 

#  resource "null_resource" "cluster" {
#   triggers = {
#     instance_id = aws_instance.catalogue.id
#   }

#   # Connection block applies to all provisioners in this resource
#   connection {
#     type        = "ssh"
#     user        = "ec2-user"
#     private_key = file("terraform.pem")
#     host        = aws_instance.catalogue.public_ip
#   }

#   provisioner "file" { 
#     source      = "catalogue.sh"
#     destination = "/tmp/catalogue.sh"
#   }

#   provisioner "remote-exec" {
#   inline = [
#     "chmod +x /tmp/catalogue.sh",
#     "sudo bash /tmp/catalogue.sh > /tmp/catalogue.log 2>&1",
#     "EXIT_CODE=$?",
#     "cat /tmp/catalogue.log",
#     "exit $EXIT_CODE"
#   ]
# }
# }


//Stop the instance and take the ami_id and delete instance
 resource "aws_ec2_instance_state" "catalogue_instance" {
  instance_id = aws_instance.catalogue.id
  state       = "stopped"
  depends_on = [ aws_instance.catalogue ]
  //depends_on = [ null_resource.cluster ]
}
 //taking ami_id
  resource "aws_ami_from_instance" "catalogue_ami" {
  name = "My_instance's Ami"
  source_instance_id = aws_instance.catalogue.id
  depends_on = [ aws_ami_from_instance.catalogue_instance ]
}

//delete instance using aws command line. But for this to run you must have aws command line installed on the jenkins server
resource "null_resource" "delete_instance" {
  triggers = {
  instance_id = aws_ami_from_instance.catalogue_ami.id
   }

provisioner "local-exec" {
    command = "aws ec2 terminate-instances --instance-ids ${aws_instance.catalogue.id}"

  }
 depends_on = [ aws_ami_from_instance.catalogue_ami ]
 
}
//The remaining process is alb steps = load balancer,targetgroup,listener,rule,launch template,autoscaling group,auroscaling policy

#In this folder you will apply terraform init,plan,apply
module "ec2" { 
source = "../ec2_modules"
#To use terraform module registry = source = "terraform-aws-modules/vpc/aws"
#To call github stored modules = "git::<https of github repo>"
ami_id = var.ami_id
instance_type = var.instance_type 
tags = var.tags
}


output "instance_id" {
  value = module.ec2.pub_ip  #module.module-name.output-variable-name
}

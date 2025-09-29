module "minikube" {
  source = "github.com/scholzj/terraform-aws-minikube"

  cluster_name  = "minikube"
  aws_region    = "us-east-1"
  aws_instance_type = "t2.medium"
  # ~ -> means home directory(/c/Users/user). So you should have terraform.pub in your home directory
  ssh_public_key = "~/terraform.pub"
  aws_subnet_id = "subnet-0681e1e3a08354aa7"
  hosted_zone = "cryl91.com"
  # hosted_zone = "jointdevops.online"
  hosted_zone_private = false

  tags = {
    Application = "Minikube"
  }

  addons = [
      "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/kubernetes-dashabord/init.sh",
      "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/kubernetes-metrics-server/init.sh",
      "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/external-dns/init.sh",
      "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/kubernetes-nginx-ingress/init.sh"
  ]
}


# Steps = 
# 1. Minikube install
# 2. Minikube start(uses docker driver) or minikube start --memory = 4096 --driver = hyperkit 
# 3. Minikube ssh = You wil login to the kubernetes cluster. And do curl podIP and you can access the pod application. 
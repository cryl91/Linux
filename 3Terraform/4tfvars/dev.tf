#dev tfvars
# instance_name = "Dev-mongodb"
 
# tags = {
#     Name = "mongodb-dev"
#     Envirnoment-dev = "dev"
    
#     }



variable "tags" {
    default = { 
        Name = "mongodb_dev"
        Envirnoment = "dev"
    
    }
}
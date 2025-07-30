 
variable "ami_id"{
type = string
}

variable "instance_type"{
type = string
}

variable "tags"{
   type = map
   default = {
      Name = "mongodb"
      Envirnoment = "dev"
   }
}
variable "tags" {
    type = map
    default = { 
        Name = "mongodb"
        Envirnoment = "dev"
    
    }
}


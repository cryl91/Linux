variable "instances" {
    default = "t2.micro"
}

variable "ami_id"{
type = string
default = "ami-08b5b3a93ed654d19"
}

variable "tags" {
    type = map
    default = { 
        Name = "mongodb"
        Envirnoment = "dev"
    
    }
}


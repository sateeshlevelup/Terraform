variable "ec2_instance_count" {
    description = " This variable to crate number of ec2 instacne"
    type = number
    default = 2
    
  
}

variable "ec2_ami_id" {
    description = "ami id"
    type = string
    default = "ami-0df435f331839b2d6"
  
}

variable "ec2_instance_type" {
    description = "insctance type"
    type = string
    default = "t2.micro"
  
}

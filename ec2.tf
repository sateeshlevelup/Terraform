# Terraform Settings BLock

terraform {
    required_providers {
      aws={
        source = "hashicorp/aws"
      }
    }
  
}


# Provider Block

provider "aws" {
    profile = "default"
    region = "us-east-1"
  
}

#Resource Blcok

resource "aws_instance" "demoinstane" {
    ami = "ami-0b0dcb5067f052a63"
    instance_type = "t2.micro"
  
}


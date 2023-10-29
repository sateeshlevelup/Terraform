resource "aws_instance" "demo1" {
    ami           = "ami-0dbc3d7bc646e8516"
    instance_type = var.instance_type[terraform.workspace]
}

variable "instance_type" {
    type = map
    default = {
        default = "t2.nano"
        dev     = "t2.micro"
        prod    = "t2.large"
    }
  

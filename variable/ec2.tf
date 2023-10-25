resource "aws_instance" "my-ec2-vm" {
    ami = "ami-0df435f331839b2d6"
    instance_type = "t2.micro"
    count = var.ec2_instance_count
  
}

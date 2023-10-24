resource "aws_instance" "demo" {
    ami = "ami-0df435f331839b2d6"
    instance_type = "t2.micro"
    count = 7
    tags = {
      "Name" = "Demo-${count.index}"
    }
  
}

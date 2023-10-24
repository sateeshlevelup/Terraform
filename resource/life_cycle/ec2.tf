resource "aws_instance" "name" {
    ami = "ami-0df435f331839b2d6"
    instance_type = "t2.micro"
    availability_zone = "us-east-1a"
    tags = {

        "Name" = "Demo-01"
    }

    lifecycle {
        create_before_destroy = false
        prevent_destroy = false
        ignore_changes = [ tags,key_name ]
      
    }
  
}

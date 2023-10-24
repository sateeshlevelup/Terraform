resource "aws_instance" "my-ec2-vm" {
  ami                    = "Give your AMI ID"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.vpc-dev-public-subnet-1.id
  key_name               = "terraform-key"
  user_data              = file("webserver.sh")
  vpc_security_group_ids = [aws_security_group.dev-vpc-sg.id]



}

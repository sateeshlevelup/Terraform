resource "aws_instance" "my-ec2-vm" {
  ami           = data.aws_ami.amzlinux.id
  instance_type = var.ec2_instance_type


}

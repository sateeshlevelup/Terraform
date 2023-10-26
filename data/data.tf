data "aws_ami" "amzlinux" {
    most_recent = true
    owners = ["amazon"]
    filter {
      name = "state"
      values = ["available"]

    }

     filter {
      name = "root-device-type"
      values = ["ebs"]

    }

     filter {
      name = "virtualization-type"
      values = ["hvm"]

    }

     filter {
      name = "architecture"
      values = ["x86_64"]

    }

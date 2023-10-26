output "ec2_public_ip" {
    description = "Public Ip "
    value = aws_instance.my-ec2-vm.public_ip


  
}

output "ec2_private_ip" {
    description = "private ip"
    value = aws_instance.my-ec2-vm.private_ip
  
}

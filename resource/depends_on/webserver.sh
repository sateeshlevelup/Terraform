#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl enable httpd
sudo systemctl start httpd
echo "<h1> Welcome to LevelUP ! You are learning Terraform</h1>" > /var/www/html/index.html

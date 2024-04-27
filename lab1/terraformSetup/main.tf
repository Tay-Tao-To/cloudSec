provider "aws" {
    region = "ap-southeast-1"  // Replace with your AWS region
    profile = "default"
}

resource "aws_security_group" "allow_http" {
    name        = "allow_http"
    description = "Allow HTTP inbound traffic"

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "web" {
    ami           = "ami-06c4be2792f419b7b"  // Replace with your AMI ID
    instance_type = "t2.micro"

    vpc_security_group_ids = [aws_security_group.allow_http.id]
    key_name = "cloudSec"
    tags = {
        Name = "web-server"
    }
}

output "instance_public_ip" {
    description = "Public IP of the instance"
    value       = aws_instance.web.public_ip
}

output "instance_public_dns" {
    description = "Public DNS of the instance"
    value       = aws_instance.web.public_dns
}
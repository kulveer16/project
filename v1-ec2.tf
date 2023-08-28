provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "demoserver" {
 ami = "ami-051f7e7f6c2f40dc1" 
 instance_type = "t2.micro"
 key_name = "learning"
 security_groups = ["demosg"]

}

resource "aws_security_group" "demosg" {
  name        = "demosg"
  description = "Allow ssh inbound traffic"


  ingress {
    description      = "ssh from VPC"
    from_port        = 22
    to_port          = 2
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "ssh-port"
  }
}
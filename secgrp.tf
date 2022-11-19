data "aws_security_group" "my_sg" {
  name   = "my_sg"
  description = "Security group for my project"
  vpc_id = module.vpc.vpc_id
}

ingress {
    description = "Rules for inward traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

egress {
    description = "Rules for outgoing traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

resource "aws_security_group" "bastion_sg" {
    name = "bastion_sg"
    description = "Security group for bastion"
    vpc_id      = module.vpc.vpc_id
  
    ingress {
        description = "Rules for inward traffic"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = [var.MYIP]
    }

    egress {
        description = "Rules for outgoing traffic"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

  
resource "aws_security_group" "beanstalk_sg" {
    name = "beanstalk_sg"
    description = "Security group for beanstalk"
    vpc_id      = module.vpc.vpc_id

    ingress {
        description = "Rules for inward traffic"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = [var.MYIP]
    }

    egress {
        description = "Rules for outgoing traffic"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
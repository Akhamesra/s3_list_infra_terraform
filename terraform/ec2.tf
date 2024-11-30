data "aws_ami" "al2" {
  most_recent = true
  owners      = var.aws_ami_owner
  filter {
    name   = "name"
    values = var.aws_ami_name_regex
  }
  filter {
    name   = "architecture"
    values = var.aws_ami_arch
  }
}

resource "aws_security_group" "flask_sg" {
  name        = var.aws_sg_name
  description = var.aws_sg_description
  vpc_id = var.aws_vpc_id

  ingress {
    from_port   = var.aws_sg_port_expose
    to_port     = var.aws_sg_port_expose
    protocol    = var.aws_sg_ingress_protocol
    cidr_blocks = var.aws_sg_open_cidr_block
  }

  egress {
    from_port   = var.aws_sg_egress_all_port
    to_port     = var.aws_sg_egress_all_port
    protocol    = var.aws_sg_egress_all_protocol
    cidr_blocks = var.aws_sg_open_cidr_block
  }
}

resource "aws_instance" "flask_instance" {
  ami           = "${data.aws_ami.al2.id}"
  instance_type = var.aws_instance_type
  key_name      = var.aws_key_name
  subnet_id = var.aws_public_subnet_id
  iam_instance_profile = aws_iam_instance_profile.app_profile.id
  vpc_security_group_ids = ["${aws_security_group.flask_sg.id}"]
  user_data = file("${path.module}/user-data.sh")
  tags = {
    Name = var.aws_ec2_name
  }
}

resource "aws_eip" "flask_eip" {
  instance = aws_instance.flask_instance.id
}
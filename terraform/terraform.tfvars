# AWS Region
aws_region = "ap-south-1"

############# AWS SG #############
aws_sg_name = "flask_app_sg"
aws_sg_description = "Allow traffic for Flask app"
aws_sg_port_expose = 5000
aws_sg_open_cidr_block = ["0.0.0.0/0"]
aws_sg_ingress_protocol = "tcp"
aws_sg_egress_all_port = "0"
aws_sg_egress_all_protocol = "-1"
aws_vpc_id = "vpc-04c6c7e6367678ca8"

############# AWS IAM #############
aws_role_name = "flask_app_role"
aws_policy_name = "flask_app_s3_role"
aws_policy_description = "Allow EC2 instance to access s3"
aws_role_SSM_policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"

############# AWS EC2 #############
aws_ec2_name = "S3_List_App"
aws_instance_type = "t2.micro"
aws_key_name = "flask_app_key"
aws_public_subnet_id = "subnet-0c82112dda7f26a11"

variable "aws_region" {
  default     = "ap-south-1"
  description = "AWS region"
}

############# AWS SG #############
variable "aws_sg_name" {
    default = "flask_app_sg"
    description = "SG Name for flask app"
}

variable "aws_sg_description" {
    default = "Allow traffic for Flask app"
    description = "SG Description for flask app"
}

variable "aws_sg_port_expose" {
    default = 5000
    description = "Port number on which the flask app runs"
}

variable "aws_vpc_id" {
  default = "vpc-04c6c7e6367678ca8"
  description = "VPC ID"
}
variable "aws_sg_open_cidr_block"{
    default = ["0.0.0.0/0"]
    description = "Allow all traffic to connect to the flask app"
}

variable "aws_sg_ingress_protocol" {
    default = "tcp"
}

variable "aws_sg_egress_all_port" {
    default = "0"
}

variable "aws_sg_egress_all_protocol" {
    default = "-1"
}


############# AWS IAM #############
variable "aws_role_name" {
    default = "flask_app_role"
    description = "AWS IAM Role name for the flask app"
}
variable "aws_policy_name" {
    default = "flask_app_s3_role"
    description = "AWS IAM Policy name for the flask app"
}
variable "aws_policy_description" {
    default = "Allow EC2 instance to access s3"
    description = "AWS IAM Policy Description for the flask app"
}
variable "aws_role_SSM_policy_arn" {
    default = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
    description = "AWS SSM Policy arn"
}


############# AWS EC2 #############

variable "aws_ec2_name" {
    default = "S3_List_App"
    description = "Name of the flask ec2 instance"
}

variable "aws_instance_type" {
  default     = "t2.micro"
  description = "Instance type for the EC2 instance"
}

variable "aws_public_subnet_id" {
    default = "subnet-0c82112dda7f26a11"
    description = "Subnet Id of public subnet"
}
variable "aws_key_name" {
  default     = "flask_app_key"
  description = "Name of the SSH key pair"
}

variable "aws_ami_owner" {
    default = ["amazon"]
    description = "Name of the owner whose ami we are using"
}

variable "aws_ami_name_regex" {
    default = ["amzn2-ami-hvm*"]
    description = "Regex of the AMI "
}

variable "aws_ami_arch" {
    default = ["x86_64"]
    description = "Architecture of the ami"
}

#!/bin/bash
yum update -y
yum install -y git python3-pip

git clone https://github.com/Akhamesra/s3_list_app.git /home/ec2-user/s3_list

cd /home/ec2-user/s3_list
pip3 install -r requirements.txt
nohup python3 app.py &

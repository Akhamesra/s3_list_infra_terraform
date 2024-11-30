output "public_ip" {
  value       = aws_eip.flask_eip.public_ip
  description = "Public IP of the EC2 instance"
}

output "public_dns" {
  value       = aws_instance.flask_instance.public_dns
  description = "Public DNS of the EC2 instance"
}

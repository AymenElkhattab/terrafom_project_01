output "instance_id" {
  description = "ID de l'instance EC2"
  value       = aws_instance.vm.id
}

output "public_ip" {
  description = "Adresse IP publique de l'instance"
  value       = aws_instance.vm.public_ip
}

output "public_dns" {
  description = "DNS public de l'instance"
  value       = aws_instance.vm.public_dns
}

output "ami_id" {
  description = "AMI utilisée"
  value       = data.aws_ami.ubuntu_24_04.id
}

output "ssh_command" {
  description = "Commande SSH pour se connecter"
  value       = "ssh -i ~/.ssh/labuser.pem ubuntu@${aws_instance.vm.public_ip}"
}

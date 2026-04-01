variable "aws_region" {
  description = "Région AWS"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Type d'instance EC2"
  type        = string
  default     = "t2.large"
}

variable "instance_name" {
  description = "Nom de l'instance EC2"
  type        = string
  default     = "ubuntu-24-04-vm"
}

variable "key_name" {
  description = "Nom de la clé SSH (key pair) AWS"
  type        = string
  default     = "vockey"
}

variable "root_volume_size" {
  description = "Taille du volume racine en Go"
  type        = number
  default     = 20
}

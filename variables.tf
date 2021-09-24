## Terraform Variables
variable "name" {
    default = "fedora-panama-day"
}

variable "environment" {
  default = "demo"
}
variable "vpc_cidr" {
  default = "172.31.0.0/16"
}
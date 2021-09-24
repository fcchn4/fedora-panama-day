# VPC module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.7.0"

  name = "${var.name}-vpc"
  cidr = var.vpc_cidr

  azs             = ["ca-central-1a", "ca-central-1b"]
  private_subnets = ["172.31.1.0/24", "172.31.2.0/24"]
  public_subnets  = ["172.31.3.0/24", "172.31.4.0/24"]

  enable_nat_gateway     = true
  single_nat_gateway     = false
  one_nat_gateway_per_az = false

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}

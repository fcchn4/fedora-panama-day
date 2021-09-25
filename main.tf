## Create security group
module "web_server_sg" {
  source  = "terraform-aws-modules/security-group/aws//modules/http-80"
  version = "4.3.0"

  name        = "web-server-sg"
  description = "Security group demo"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = [var.vpc_cidr]
}


## Create EC2 Instance and Security Group
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.1.0"

  name                   = "demo-instance"
  ami                    = "ami-0ea1d927261d4fc0c"
  instance_type          = "t2.micro"
  key_name               = "ubuntu"
  monitoring             = "false"
  vpc_security_group_ids = [module.web_server_sg.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Terraform    = "true"
    Environtment = var.environment
  }
}

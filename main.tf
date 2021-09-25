## Create security group
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

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
  ami                    = "ami-07bee82ddd97631a4"
  instance_type          = "t2.micro"
  key_name               = "fedora-panama-key"
  monitoring             = "false"
  vpc_security_group_ids = [module.web_server_sg.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  user_data = <<-EOT
    yum install nginx
  EOT

  tags = {
    Terraform    = "true"
    Environtment = var.environment
  }
}

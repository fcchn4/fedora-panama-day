## Security Group
module "web_server_sg" {
    source = "terraform-aws-modules/security-group/aws//modules/http-80"
    version = "4.3.0"

    name = "${var.name}-sg"
    description = "Demo deploy simple web server"
    vpc_id = var.vpc_cidr
    
    #ingress_cidr_blocks = var.vpc_cidr
}
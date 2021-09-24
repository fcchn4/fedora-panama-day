## Show variables
output "vpc_azs" {
    description = "Fedora Panama Day - Availavility Zones"
    value = module.vpc.azs  
}

output "vpc_cidr" {
    description = "Fedora Panama Day - VPC CIDR"
    value = module.vpc.vpc_cidr_block
}

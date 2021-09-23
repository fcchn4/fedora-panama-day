## Terraform required versions
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.59.0"
    }
    github = {
      source  = "integrations/github"
      version = "4.15.1"
    }
  }
}

## Config account provider
provider "aws" {
  region  = "us-west-2" # Oregon
  profile = "nextbrave"
}

provider "github" {
  organization = "fcchn4"
}

## Terraform state logs
#terraform {
#  backend "s3" {
#    bucket = "fedora-panama-day"
#    key    = "fedora-panama-day"
#    region = "us-west-2"
#    encrypt = false
#  }
#}


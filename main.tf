provider "aws" {
  region = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "devops-tf-circleci"
    key    = "platform.tfstate"
    region = "us-east-1"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "ubuntu" {
  ami           = "ami-0b93ce03dcbcb10f6"
  instance_type = "t2.micro"
  subnet_id     = "subnet-00648c056a82ad54c"
}
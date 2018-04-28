provider "aws" {
  region = "${var.region}"
}

data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "1.30.0"
  name    = "${var.name_prefix}-${var.env_prefix}"

  cidr            = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.100.0/24", "10.0.200.0/24"]

  azs = ["${data.aws_availability_zones.available.names}"]

  enable_dns_hostnames = true
  enable_dns_support   = true
  enable_nat_gateway   = true
  single_nat_gateway   = true

  tags = "${var.tags}"
}

resource "aws_security_group" "web" {
  name   = "${var.name_prefix}_${var.env_prefix}_web"
  vpc_id = "${module.vpc.vpc_id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name_prefix}-${var.env_prefix}-web"
  }
}

resource "aws_security_group" "db" {
  name   = "${var.name_prefix}_${var.env_prefix}_db"
  vpc_id = "${module.vpc.vpc_id}"

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "TCP"
    security_groups = ["${aws_security_group.web.id}"]
  }

  tags = {
    Name = "${var.name_prefix}-${var.env_prefix}-db"
  }
}

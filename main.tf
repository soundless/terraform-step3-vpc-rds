terraform {
  required_version = ">= 0.10.3"
}

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source      = "./network-vpc/"
  name_prefix = "${var.name_prefix}"
}

module "db" {
  source      = "./postgres-db/"
  name_prefix = "${var.name_prefix}"
  subnet_ids  = "${module.vpc.private_subnets}"
  vpc_security_group_ids = "${module.vpc.db_security_group_id}"
}

module "web" {
  source          = "./glx-manager/"
  name_prefix     = "${var.name_prefix}"
  rds_db_name     = "${var.db_name}"
  rds_username    = "${var.db_username}"
  rds_password    = "${var.db_password}"
  rds_port        = "${module.db.db_port}"
  rds_hostname    = "${module.db.db_host}"
  vpc_id          = "${module.vpc.vpc_id}"
  public_subnets  = ["${module.vpc.public_subnets}"]
  private_subnets = ["${module.vpc.private_subnets}"]
  security_groups = ["${module.vpc.web_security_group_id}"]
}

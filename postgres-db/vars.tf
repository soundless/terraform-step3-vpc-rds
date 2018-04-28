variable "name_prefix" {
  default = "webmanager-db"
}

variable "env_prefix" {
  default = "terraform"
}

variable "tags" {
  type = "map"

  default = {
    Terraform = "true"
  }
}

variable "allocated_storage" {
  default = "5"
}

variable "engine_version" {
  default = "9.5.12"
}

variable "instance_class" {
  default = "db.t2.micro"
}

variable "storage_type" {
  default = "standard"
}

variable "backup_retention_period" {
  default = "35"
}

variable "multi_az" {
  default = "true"
}

variable "vpc_security_group_ids" {}

variable "subnet_ids" {
  type = "list"
}

variable "parameter_group_family" {
  default = "postgres9.5"
}

variable "db_port" {
  default = "5432"
}

variable "db_name" {
  default = "ebdb"
}

variable "db_username" {
  default = "dbuser"
}

variable "db_password" {
  default = "changeme"
}

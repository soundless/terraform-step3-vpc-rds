variable "region" {
  default = "us-east-1"
}

variable "name_prefix" {
  default = "webmanager"
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

variable "name_prefix" {
  default = "webmanager"
}

variable "env_prefix" {
  default = "terraform"
}

variable "vpc_id" {
  description = "ID of the VPC to use"
}

variable "private_subnets" {
  type        = "list"
  description = "ID of private subnets for EC2-instances"
}

variable "public_subnets" {
  type        = "list"
  description = "ID of public subnets for EC2-instances"
}

variable "ssh_key" {
  default = "htian-office"
  description = "ID of key pair that will be granted SSH access to the servers"
}

variable "healthcheck_location" {
  default = ""
  description = "Location for Load balancer to check for response to see if instances in autoscaling group are healthy"
}

variable "instance_type" {
  default = "t2.micro"
  description = "Which AWS instance type (e.g. t2.micro) to start up ec2-nodes on"
}

variable "loadbalancing_desired_nodes" {
  default = 2
  description = "Desired amount of nodes in autoscaling group"
}  

variable "loadbalancing_min_nodes" {
  default = 2
  description = "Minimum amount of nodes in autoscaling group"
}
variable "loadbalancing_max_nodes" {
  default = 2
  description = "Maximum amount of nodes in autoscaling group"
}
variable "security_groups" {
  type    = "list"
  description = "Lists the Amazon EC2 security groups to assign to the EC2 instances in the Auto Scaling group in order to define firewall rules for the instances."
}

variable "service_role" {
  default = "terraform-elasticbeanstalk-service-role"
}

variable "ec2_role" {
  default = "terraform-elasticbeanstalk-ec2-role"
}

variable "rds_username" {}

variable "rds_password" {}

variable "rds_hostname" {}

variable "rds_db_name" {}

variable "rds_port" {}


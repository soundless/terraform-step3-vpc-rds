output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "public_subnets" {
  value = ["${module.vpc.public_subnets}"]
}

output "private_subnets" {
  value = ["${module.vpc.private_subnets}"]
}

output "nat_public_ips" {
  value = ["${module.vpc.nat_public_ips}"]
}

output "default_security_group_id" {
  value = "${module.vpc.default_security_group_id}"
}

output "db_security_group_id" {
  value = "${aws_security_group.db.id}"
}

output "web_security_group_id" {
  value = "${aws_security_group.web.id}"
}

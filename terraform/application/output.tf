output "instance" {
  value = "${aws_instance.application}"
}

output "rds" {
  value = "${aws_db_instance.default.endpoint}"
}

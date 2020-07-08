# Create RDS
resource "aws_db_instance" "default" {
  allocated_storage      = 100
  storage_type           = "gp2"
  engine                 = "postgres"
  engine_version         = "11.2"
  instance_class         = "db.t2.micro"
  name                   = "ten4ssdp"
  username               = var.dbusername
  password               = var.dbpassword
  publicly_accessible    = true
  vpc_security_group_ids = ["${aws_security_group.rdsSG.id}"]
}

# resource "null_resource" "setup_db" {
#   depends_on = [aws_db_instance.default, aws_security_group.web, aws_security_group.rdsSG]
#   provisioner "local-exec" {
#     command = "psql -U ${aws_db_instance.default.username} -h ${aws_db_instance.default.address} < db.sql"
#   }
# }

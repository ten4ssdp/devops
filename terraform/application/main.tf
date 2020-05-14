resource "aws_instance" "application" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name      = var.instance_key_name

  count         = var.instance_count

  security_groups = [aws_security_group.web.name]

  tags = {
    Name      = "${var.stage}-application"
    component = "application"
    stage     = var.stage
  }
}

# Create a new load balancer
resource "aws_elb" "application" {
  name               = "${var.stage}-app-elb"
  availability_zones = ["eu-west-2a"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:5000/api"
    interval            = 30
  }

  instances                   = aws_instance.application.*.id
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "${var.stage}-elb"
  }
}

resource "aws_security_group" "rdsSG" {
  name = "rdsSG"
  description = "RDS security group"

  ingress {
    description = "rds"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = ["${aws_security_group.web.id}"]
  }
  egress {
    description     = "rds"
    from_port       = 0
    to_port         = 0
    protocol        = -1
    cidr_blocks     = ["0.0.0.0/0"]
    self            = true
  }  
}

# Create RDS
resource "aws_db_instance" "default" {
  allocated_storage       = 100
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "5.7"
  instance_class          = "db.t2.micro"
  name                    = "ten4ssdp"
  username                = "root"
  password                = "dumbpwdlolmdrlol"
  vpc_security_group_ids      = ["${aws_security_group.rdsSG.id}"]
}

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

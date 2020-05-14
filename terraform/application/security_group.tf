resource "aws_security_group" "web" {
  name        = "${var.stage}-application"
  description = "Allow inbound traffic"

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    
    cidr_blocks     = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 5000
    to_port     = 5050
    protocol    = "tcp"
    
    cidr_blocks     = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    
    cidr_blocks     = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}
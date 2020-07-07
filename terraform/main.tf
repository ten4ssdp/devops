provider "aws" {
  version = "~> 2.0"
  region  = "eu-west-2"
}

resource "aws_key_pair" "adminkeypair" {
  key_name = "adminkeypair"
  public_key = file(var.ssh_public_key)
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

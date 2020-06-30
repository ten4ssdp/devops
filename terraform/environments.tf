module "production" {
  source = "./application"

  instance_type     = "t2.micro"
  instance_ami      = "${data.aws_ami.ubuntu.id}"
  instance_count    = 1
  instance_key_name = "${aws_key_pair.adminkeypair.key_name}"
  stage             = "production"
}

resource "aws_key_pair" "adminkeypair" {
  key_name = "adminkeypair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDezZsW6qyKy85wfiEO1MQSUTI00e1R2X796F7XVLUxvudXzgpbCzmnX2W07da5FME3khh4RPs6OeZexUMvOVb5TGKd+RZjVASPx4W2oYlQFEQAqlNt7wITr1+IW06733+ZtXXEcDlaz4qBYMhLyLXsklFNNCYuA1K4sLNboCcHtPhl8oXHodIn1CShCarh0aDMeXtVYWOF+cyN2sTQsj1vcotU6gNHbW2SZN4tEWVRCANWol+SlG20ABmWRTX9b+D6nBh8q+IDiiRwrVssZJa47oQQXU5nwJKlzgTlr5J+Dkhs8jFngtlFKdyGlVQrNUOzi99NJJyr/hav/RADExw+A90lWOTaRmfap6h2IZn21Rc17FygPOvFTbfkF1vhRppej5HzQ7qPFqardWyh7WvQwPQETa8vVrPOL7krgaQG5PhsLXYvhgytlmeHbStboeVwDJKwcM9urbPzTsc8LoWpcQXMzOoW6fOnHYHUBdZfYEPgZN1mknOic46TYriyQnTZ4NxK4EZe/sssB+9LshyvI7Wnp9J5FL/M/g2FUfV7TZdPgpK2DrCIMgVhs+wx7Y7L6tX5Cr0zRTyONO9gcKWmG0ExISSBlgyzYQa3EY0kJVhcxGD4Ws5Mi1JucgRLF7EL+xhpKV7DS8oNrpVSyxI66mP3TZSPTBKeSxgE5vIH+w== paartheepan@MacBook-Pro-de-Paartheepan.local"
}

resource "aws_instance" "appserver" {
  ami = "ami-096b8af6e7e8fb927"
  instance_type = "t2.micro"
  key_name = "adminkeypair"
  vpc_security_group_ids = ["${aws_security_group.web.id}"]
}

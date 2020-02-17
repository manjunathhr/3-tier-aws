# creating new keypair in EC2
resource "aws_key_pair" "auth" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
  #public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC+1e4dmTwmE2jaf/2GzrY8U7sRzM21iU4WR4XDMf89rZW2S8qWbfAmlRMqAj3xOt6Fime0zuUTjqocEh5LYRa2MaTmNLojsE3FUqhDR3rl+zeG17Oo8IpTU5oJqtFDjL1uml7meiqBg1EkPn6wI4EsLQ2PmOhmRrEaeOn12MO5wdow30cawTpJfQrXHvoDecu+wNJ4ETISpRlhGwjpAuqGzZAP+BMOJWdYpNVVlsftK3Kb26SSEfH7ogFcbZIenHMYXNgHpR8QVzF1bPJxAfKqIVq4n8j/U1AQPgZKSW0E/8YDNqfm7s0SUNhkAJkAS3ZoPt/hn+7CrPFwN7jzPHdx mramaiah@sunteckmac"
}

resource "aws_instance" "myinst" {
  ami           = data.aws_ami.coreos.id
  #ami = "ami-0e61341fa75fcaa18"
  instance_type = var.instance_type
  key_name      = var.key_name

  source_dest_check = false

  # using a public subnet for external availability
  subnet_id = aws_subnet.public_subnet.id

  # adding a public IP to it, so we can access from outside
  associate_public_ip_address = true

  tags = {
    BuiltWith = "terraform"
    Name      = "3t"
  }

  # attaching security group
  vpc_security_group_ids = [aws_security_group.t3-security-group.id]

  # adding the user data
  user_data = data.template_file.user_data.rendered
}

# resource that renders the userdata template
data "template_file" "user_data" {
  template = file("user-data.tpl") # no extra variables here so just passing the plain file
}


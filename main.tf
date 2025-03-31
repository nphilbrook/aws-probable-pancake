data "aws_ami" "rhel9" {
  most_recent = true

  filter {
    name   = "name"
    values = ["RHEL-9*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  owners = ["309956199498"] # Red Hat
}


resource "aws_instance" "test" {
  ami           = data.aws_ami.rhel9.id
  instance_type = "t3.medium"
  tags = { Name = "test",
    owner = "nick",
    foo   = "bar"
  }
  lifecycle {
    ignore_changes = [ami]
  }
}

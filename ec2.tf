/*provider "aws" {
  region = "us-west-2"
}*/

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "template_file" "user_data" {
  template = file("templates/user_data.tpl")
  vars = {
    ssm_parameter_path = var.ssm_parameter_rcon_pass_path
  }
}

resource "aws_instance" "game" {
  /*provisioner "file" {
  content      = data.template_file.server_config.rendered
  destination = "/serverconfig.xml"
  } */
  ami               = data.aws_ami.ubuntu.id
  instance_type     = "t2.medium"
  iam_instance_profile = aws_iam_instance_profile.ec2_describe_volumes_profile.name
  key_name          = "bbulla"
  vpc_security_group_ids = [aws_security_group.game.id]
  user_data         = data.template_file.user_data.rendered
  availability_zone = var.availability_zone
  tags = {
  Owner = "game"
  }
}

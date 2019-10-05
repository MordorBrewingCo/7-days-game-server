resource "aws_ebs_volume" "game_persistent" {
  availability_zone = var.availability_zone
  size              = 10
}

resource "aws_volume_attachment" "game_ec2" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.game_persistent.id
  instance_id = aws_instance.game.id
  #force_detach = true
}

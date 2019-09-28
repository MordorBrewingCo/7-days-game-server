resource "aws_ebs_volume" "7dtd_persistent" {
  availability_zone = var.availability_zone
  size              = 10
}

resource "aws_volume_attachment" "7dtd_ec2" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.7dtd_persistent.id
  instance_id = aws_instance.7dtd.id
  force_detach = true
}

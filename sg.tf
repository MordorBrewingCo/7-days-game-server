resource "aws_security_group" "7dtd" {
  name = "7dtd"
  description = "7dtd Server EC2 Security Group"
  ingress {
    from_port = 25000
    to_port = 25003
    protocol = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 26900
    to_port = 26900
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["173.84.0.0/14"]
  }
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
#    cidr_blocks = ["173.87.32.128/25", "98.10.111.0/25", "206.251.217.0/24"]
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 8082
    to_port = 8082
    protocol = "tcp"
#    cidr_blocks = ["173.87.32.128/25", "98.10.111.0/25", "206.251.217.0/24"]
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

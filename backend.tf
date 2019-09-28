### BACKEND ###

terraform {
  backend "s3" {
    bucket         = "7dtd-fragtopia-us-west-2-389684724582-terraform"
    encrypt        = true
    key            = "7dtd-server.tfstate"
    region         = "us-west-2"
    dynamodb_table = "7dtd-fragtopia-locktable"
  }
}

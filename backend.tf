### BACKEND ###

terraform {
  backend "s3" {
    bucket         = "game-zombtopia-us-west-2-389684724582-terraform"
    encrypt        = true
    key            = "game-server.tfstate"
    region         = "us-west-2"
    dynamodb_table = "game-zombtopia-locktable"
  }
}

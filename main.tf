provider "aws" {
  region = var.region
}

resource "aws_instance" "yuga" {
  ami           = var.ami
  instance_type = var.instance_type
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
  tags = {
    Name = "yuga"
  }
}

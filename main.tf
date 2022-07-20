resource "aws_instance" "web" {
  instance_type = "t2.micro"
  ami           = "ami-08df646e18b182346"
}

resource "aws_s3_bucket" "b" {
  bucket = "awsgitzipfile1"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}
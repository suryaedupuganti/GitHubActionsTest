resource "aws_instance" "web" {
  instance_type = "t2.micro"
  ami           = "ami-068257025f72f470d"
}

resource "aws_s3_bucket" "b" {
  bucket = "backend-surya7"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}
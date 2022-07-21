resource "aws_instance" "web" {
  instance_type = "t2.micro"
  ami           = "ami-068257025f72f470d"
}


resource "aws_security_group" "allow_https" {
  name        = "allow_https"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-048bed2da6f6b465c"

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["10.0.0.0/16"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
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
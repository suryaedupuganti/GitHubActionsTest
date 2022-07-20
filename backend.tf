terraform {
  backend "s3" {
    bucket = "backend-surya"
    region = "ap-south-1"
    key    = "terraform.tfstate"
  }
}
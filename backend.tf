terraform {
  backend "s3" {
    bucket = "psi-github-actions-018-617"
    region = "ap-south-1"
    key    = "terraform.tfstate"
  }
}
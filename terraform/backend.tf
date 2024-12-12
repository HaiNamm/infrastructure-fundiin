terraform {
  backend "s3" {
    bucket = "hhainam23-app"
    region = "ap-southeast-1"
    key = "eks/terraform.tfstate"
  }
}
terraform {
  backend "s3" {
    bucket = "hhainam-app"
    region = "ap-southeast-1"
    key = "jenkins-server/terraform.tfstate"
  }
}
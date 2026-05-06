locals {
  env         = var.Environment
  vpc_name    = "${var.title}-${var.Environment}-VPC"
  bucket_name = lower("${var.title}-${var.Environment}-bucket")
  region      = "ap-south-1"
}

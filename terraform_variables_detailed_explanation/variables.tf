variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
default = "us-east-2"
}

variable "aws_endpoint" {
  type = string
  description = "AWS endpoint for LocalStack"
}

variable "aws_s3_endpoint" {
  type = string
  description = "AWS endpoint for LocalStack"
}
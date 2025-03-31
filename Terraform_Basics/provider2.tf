provider "aws" {
  endpoints {
    sts = var.aws_endpoint
    ec2 = var.aws_endpoint
    s3  = var.aws_s3_endpoint

    ##s3  = "http://s3.localhost.localstack.cloud:4566"
    ##sts = "http://localhost:4566"
    ##ec2 = "http://localhost:4566"

  }
}
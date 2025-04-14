provider "aws" {
  endpoints {
    sts = var.aws_endpoint
    ec2 = var.aws_endpoint
    s3  = var.aws_s3_endpoint

    ##s3  = "http://s3.localhost.localstack.cloud:4566"
    ##sts = "http://localhost:4566"
    ##ec2 = "http://localhost:4566"

  }
  # Skip credential validation and region validation since we're using LocalStack
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
}
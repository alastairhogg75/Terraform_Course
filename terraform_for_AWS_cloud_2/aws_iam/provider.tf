provider "aws" {
    access_key = "${var.AWS_ACCESS_KEY}"
    secret_key = "${var.AWS_SECRET_KEY}"
    region     = "${var.AWS_REGION}" 

endpoints {
    sts = var.aws_endpoint
    ec2 = var.aws_endpoint
    s3  = var.aws_s3_endpoint
    rds = var.aws_endpoint
    iam = var.aws_endpoint
  }
  # Skip credential validation and region validation since we're using LocalStack
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
}
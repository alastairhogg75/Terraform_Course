provider "aws" {
    access_key = "${var.AWS_ACCESS_KEY}"
    secret_key = "${var.AWS_SECRET_KEY}"
    region     = "${var.AWS_REGION}" 

endpoints {
    sts = var.aws_endpoint
    ec2 = var.aws_endpoint
    s3  = var.aws_s3_endpoint
  }
}
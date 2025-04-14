variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {test}

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

/*
variable "aws_rds_endpoint" {
    type = string
  description = "AWS endpoint for LocalStack"
}
*/
variable "AMIS" {
  type = map
  default = {
    us-east-1 = "ami-04b3c39a8a1c62b76"
    us-east-2 = "ami-0b76100074ce446d4"
    us-west-2 = "ami-007efc37af963b27d"
    us-west-1 = "ami-04a119c5b7ed4e7ad"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
    default = "my_aws_keypair"
}

variable "PATH_TO_PUBLIC_KEY" {
    default = "my_aws_keypair.pub"
}

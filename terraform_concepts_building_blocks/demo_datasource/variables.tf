variable "AWS_ACCESS_KEY" {
    type = string
    default = "test"
}

variable "AWS_SECRET_KEY" {
    type = string
    default = "test"
}

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

variable "Security_Group" {
  type = list(string)
  default = ["sg-24076", "sg-90890", "sg-456789"]
}

variable "AMIS" {
  type = map
  default = {
    us-east-1 = "ami-04b3c39a8a1c62b76"
    us-east-2 = "ami-0b76100074ce446d4"
    us-west-2 = "ami-007efc37af963b27d"
    us-west-1 = "ami-04a119c5b7ed4e7ad"
  }
}

variable "AMIS" {
  type = map
  default = {
    us-west-2 = "ami-007efc37af963b27d"
    us-west-1 = "ami-04a119c5b7ed4e7ad"
  }
}
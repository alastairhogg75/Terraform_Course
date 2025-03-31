resource "aws_key_pair" "my_terraform_keypair" {
    key_name = "my_aws_keypair"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}

# Create AWS Instance
resource "aws_instance" "MyFirstInstance"{
    ami           = lookup(var.AMIS, var.AWS_REGION)
    instance_type = "t2.micro"
    availability_zone = "us-east-2a"
    key_name      = aws_key_pair.my_terraform_keypair.key_name

    tags = {
        Name = "custom_instance"
    }
}

# EBS Resource Creation
resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "us-east-2a"
  size              = 50
  type              = "gp2"

  tags = {
    Name = "Secondary Volume Disk"
  }
}

# Attach EBS Volume with AWS Instance
resource "aws_volume_attachment" "ebs-volume-1-attachment" {
    device_name = "/dev/xvdh"
    volume_id   = aws_ebs_volume.ebs-volume-1.id
    instance_id = aws_instance.MyFirstInstance.id
}


resource "aws_key_pair" "my_terraform_keypair" {
    key_name = "my_aws_keypair"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}

# Create AWS Instance
resource "aws_instance" "MyFirstInstance"{
    ami           = lookup(var.AMIS, var.AWS_REGION)
    instance_type = "t2.micro"
    key_name      = aws_key_pair.my_terraform_keypair.key_name

    vpc_security_group_ids = [aws_security_group.allow-level-up-SSH.id]
    subnet_id = aws_subnet.levelup_vpc-public-2.id

    tags = {
        Name = "custom_instance"
    }
}

output "public_ip" {
  value = aws_instance.MyFirstInstance.public_ip
}
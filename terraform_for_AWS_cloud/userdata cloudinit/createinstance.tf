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

    #user_data = file("installapache.sh")
    user_data = data.template_cloudinit_config.install-apache-config.rendered

    tags = {
        Name = "custom_instance"
    }
}

output "public_ip" {
  value = aws_instance.MyFirstInstance.public_ip
}
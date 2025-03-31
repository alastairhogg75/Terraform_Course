# Security Group for levelupvpc
resource "aws_security_group" "allow-level-up-SSH" {
    vpc_id      = aws_vpc.levelup_vpc.id
    name        = "allow-levelup-ssh"
    description = "security group that allows ssh connection"

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"] 
    } 

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "allow-levelup-ssh"
    }
}

# Security Group for MariaDB
resource "aws_security_group" "allow-MariaDB" {
    vpc_id      = aws_vpc.levelup_vpc.id
    name        = "allow-MariaDB"
    description = "security group that allows MariaDB"

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"] 
    } 

    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        security_groups = [aws_security_group.allow-level-up-SSH.id]
    }
    tags = {
        Name = "allow-mariadb"
    }
}
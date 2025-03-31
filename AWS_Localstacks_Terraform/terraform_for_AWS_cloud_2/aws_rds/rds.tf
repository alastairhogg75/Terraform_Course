# RDS Resources

resource "aws_db_subnet_group" "mariadb-subnets" {
    name = "mariadb-subnets"
    description = "Amazon RDS subnet group"
    subnet_ids = [aws_subnet.levelup_vpc-private-1.id, aws_subnet.levelup_vpc-private-2.id]
}

# RDS Parameters
resource "aws_db_parameter_group" "levelup-mariadb-Parameters" {
    name = "levelup-mariadb-parameters"
    family = "mariadb10.4"
    description = "MariaDB parameter group"

    parameter {
        name = "max_allowed_packet"
        value = "16777216"
    }
}

# RDS Instance Properties
resource "aws_db_instance" "levelup-mariadb" {
  allocated_storage = 20    # 20 GB of storage 
  engine                    = "mariadb"
  engine_version            = "10.4.8"
  instance_class            = "db.t2.micro"     # use mivro if you want to use the free tier
  identifier                = "mariadb"
  username                  = "root"            # username
  password                  = "mariadb141"      # password
  db_subnet_group_name      = aws_db_subnet_group.mariadb-subnets.name
  parameter_group_name      = aws_db_parameter_group.levelup-mariadb-Parameters.name
  multi_az                  = "false"           # set to true to have high availability: 2 instances synchronized with each availability zone
  vpc_security_group_ids    = [aws_security_group.allow-MariaDB.id]
  storage_type              = "gp2"
  backup_retention_period   = 30                # how long you're going to keep your backups
  availability_zone         = aws_subnet.levelup_vpc-private-1.availability_zone    # prefered AZ
  skip_final_snapshot       = true
  tags = {
    name = "levelup-mariadb"
  } 
}

output "rds" {
    value = aws_db_instance.levelup-mariadb.endpoint    # displays the output of your RDS Instance
}
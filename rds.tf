resource "aws_db_instance" "AddX-Rds" {
  allocated_storage    = 100
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.large"
  name                 = "myAddXDB"
  username             = "myusername"
  password             = "mypassword"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = false
}

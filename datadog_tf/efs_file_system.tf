resource "aws_efs_file_system" "efs_test_ap" {
  tags = {
    Name = "${lower(var.customer_name)}_efs"
  }
}
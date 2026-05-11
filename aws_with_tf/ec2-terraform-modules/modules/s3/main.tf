resource "aws_s3_bucket" "example" {
  bucket = var.bucket

  tags = {
    Name        = "${var.enviroments}-exlearn-bucket-074095961179"
  }
}
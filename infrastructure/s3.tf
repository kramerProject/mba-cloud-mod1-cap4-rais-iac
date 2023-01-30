resource "aws_s3_bucket" "datalake" {
  bucket = "${var.base_bucket_name}-${var.ambiente}-${var.numero_conta}"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    IES   = "IGTI",
    CURSO = "EDC"
  }
}

resource "aws_s3_bucket_object" "raw_folder" {
  bucket = aws_s3_bucket.datalake.id
  key    = "raw/"
  acl    = "private"
}

resource "aws_s3_bucket_object" "stage_folder" {
  bucket = aws_s3_bucket.datalake.id
  key    = "stage/"
  acl    = "private"
}

resource "aws_s3_bucket_object" "athenas_folder" {
  bucket = aws_s3_bucket.datalake.id
  key    = "athenas/"
  acl    = "private"
}
resource "aws_glue_crawler" "glue_crawler_rais" {
  database_name = var.database_name
  name          = var.glue_crawler_name
  role          = var.crawler_role

  s3_target {
    path = "s3://${var.base_bucket_name}-${var.ambiente}-${var.numero_conta}/stage/"
  }
}
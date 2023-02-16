resource "aws_s3_bucket_object" "spark_transform" {
    bucket = aws_s3_bucket.datalake.id
    key    = "pyspark/spark_test_manual_2.py"
    acl    = "private"
    source = "../etl/spark_test_manual_2.py"
    etag   = filemd5("../etl/spark_test_manual_2.py")
}

resource "aws_s3_object" "codigo-glue-job" {
  bucket = aws_s3_bucket.datalake.id
  key    = "/scripts/glue_job_pyspark.py"
  source = "../etl/glue_job_pyspark.py"
  etag   = filemd5("../etl/glue_job_pyspark.py")
} 
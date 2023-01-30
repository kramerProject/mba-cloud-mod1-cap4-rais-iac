resource "aws_s3_bucket_object" "spark_transform" {
    bucket = aws_s3_bucket.datalake.id
    key    = "pyspark/spark_job.py"
    acl    = "private"
    source = "../etl/spark_job.py"
    etag   = filemd5("../etl/spark_job.py")
}
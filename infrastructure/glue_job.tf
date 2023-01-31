resource "aws_glue_job" "glue_job_rais" {
  name     = var.glue_job_name
  role_arn = var.glue_role
  max_retries = "1"
  timeout = 2880 
  command {
    script_location = "s3://${var.base_bucket_name}-${var.ambiente}-${var.numero_conta}/scripts/glue_job_pyspark.py"
    python_version = "3"
  }
  execution_property {
    max_concurrent_runs = 1
  }
  glue_version = "3.0"
}
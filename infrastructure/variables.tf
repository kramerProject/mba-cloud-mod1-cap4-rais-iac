variable "base_bucket_name" {
  default = "datalake-kramer-edc-tf"
}

variable "ambiente" {
  default = "producao"
}

variable "numero_conta" {
  default = "401868797180"
}

variable "region_id" {
  default = "us-east-1"
}

variable "lambda_function_name" {
  default = "ExecuteEMR"
}

variable "glue_job_name" {
  default = "glue_job_spark_rais_challenge"
}
variable "glue_crawler_name" {
  default = "glue_crawler_rais_challenge"
}

variable "database_name" {
  default = "rais-challenge-db"
}

variable "glue_role" {
  default = "arn:aws:iam::401868797180:role/service-role/AWSGlueServiceRole-kramer-test-igti"
}

variable "key_pair_name" {
  default = "kramer-igti-rais"
}


variable "airflow_subnet_id" {
  default = "subnet-005eeffbaafd46014"
}

variable "vpc_id" {
  default = "vpc-06256913d9b993822"
}



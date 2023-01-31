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

variable "glue_crawler_name" {
  default = "glue_crawler_rais_challenge"
}

variable "database_name" {
  default = "rais-challenge-db"
}

variable "crawler_role" {
  default = "arn:aws:iam::401868797180:role/service-role/AWSGlueServiceRole-kramer-test-igti"
}


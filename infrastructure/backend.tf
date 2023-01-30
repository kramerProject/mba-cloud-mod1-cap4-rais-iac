terraform {
  backend "s3" {
    bucket = "terraform-state-kramer-401868797180"
    key    = "state/igti/edc/mod1/terraform.tfstate"
    region = "us-east-1"
  }
}
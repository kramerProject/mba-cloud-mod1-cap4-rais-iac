terraform {
  backend "s3" {
    bucket = "terraform-state-kramer-${var.numero_conta}"
    key    = "state/igti/edc/mod1/challenge/terraform.tfstate"
    region = var.region_id
  }
}
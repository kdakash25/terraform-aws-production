terraform {
  backend "s3" {
    bucket         = "terraform-global-state-demo"
    key            = "production/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
  }
}

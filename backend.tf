terraform {
  backend "s3" {
    bucket  = "terraform-global-state-demo"
    key     = "production/terraform.tfstate"
    region  = "ap-south-1"

    # New locking method
    use_lockfile = true

    encrypt = true
  }
}

terraform {
  #This will connect to s3 to store the state files.
  #Never push the state file to code repository
  backend "s3" {
    bucket       = "pritam-biswas-terraform-bucket-state"
    key          = "dev/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}



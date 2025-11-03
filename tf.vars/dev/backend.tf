 terraform {
  backend "s3" {
   bucket = "remote-state-poguri-dev"
   key = "tfvars-multi-env-demo"
   region = "us-east-1"
   use_lockfile = true
   encrypt =  true
 }
 }
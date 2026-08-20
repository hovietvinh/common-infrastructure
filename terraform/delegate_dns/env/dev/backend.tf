terraform {
  backend "s3" {
    key = "dev/delegate_dns.tfstate"
    region = "ap-southeast-1"
    encrypt = true
    use_lockfile = true
  }  
}
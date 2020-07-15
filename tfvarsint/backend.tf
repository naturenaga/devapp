terraform {
  backend "s3" {
    bucket = "jnrterraformstate"
    key    = "tfstate/samplesia-app-int/base.tfstate"
    region = "ap-south-1"
    encrypt = "true"
  }
}

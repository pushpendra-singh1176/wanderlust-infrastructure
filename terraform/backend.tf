terraform {

  backend "s3" {

    bucket         = "dev.pushpendra-wanderlust-tfstate"
    key            = "environments/dev/terraform.tfstate"
    region         = "ap-south-1"

    dynamodb_table = "terraform-lock"

    encrypt = true

  }

}
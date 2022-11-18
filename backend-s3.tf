terraform {
    backend "s3" {
        bucket = "iaac-with-tf"
        key = "terraform/backend"
        region = "us-east-2"
    }
}
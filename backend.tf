terraform {
  backend "s3" {
    bucket         = "myterraformstatefilebucket2025"
    region         = "us-east-2"
    key            = "backend.tfstate"
    dynamodb_table = "myterraformstatedynamodb"
  }
}
# AWS provider block
provider "aws" {
  region  = var.aws_region
  profile = var.aws_sso_profile
}

# Generates random id for the bucket name
resource "random_id" "rng" {
  keepers = {
    first = "${timestamp()}"
  }     
  byte_length = 8

  lifecycle {

    ignore_changes = [ keepers ]

  }
}



# Creating a S3 bucket for storing build artifacts
resource "aws_s3_bucket" "bucket" {
  bucket = "${var.bucket_name}-${random_id.rng.hex}"
}

# Codecommit repository for the pipeline
resource "aws_codecommit_repository" "repo" {
  repository_name = var.repo_name
}

# code pipeline for creating Service catalog through lambda function
module "code_pipeline" {
  source            = "./modules/pipeline"
  bucket_name       = aws_s3_bucket.bucket.bucket
  repo_name         = aws_codecommit_repository.repo.repository_name
  codebuild_project = module.codebuild.codebuild_project
  lambda_function   = module.lambda.lambda_function
}

# CodeBuild stage of the pipeline
module "codebuild" {
  source      = "./modules/codebuild"
  bucket_name = aws_s3_bucket.bucket.bucket
}

# Lambda function to create the service catalog
module "lambda" {
  source = "./modules/lambda"
}

resource "local_file" "mapping_yml" {
  filename = "mapping.yml"
  content  = templatefile("./mapping.yml.tpl", {
    product_name          = var.product_name
    product_description   = var.product_description
    portfolio_name        = var.portfolio_name
    portfolio_provider    = var.portfolio_provider
    user_arn              = var.user_arn
    user_role             = var.user_role
    owner                 = var.owner
    distributor           = var.distributor
    support_description   = var.support_description
    support_email         = var.support_email
    support_url           = var.support_url
    provisioning_name     = filesha256(var.terraform_targz_file_path)
    provisioning_description = var.provisioning_description
  })
}


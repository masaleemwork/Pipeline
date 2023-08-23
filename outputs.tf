output "s3_artifacts_bucket" {
    value = aws_s3_bucket.bucket.bucket
}

output "codecommit_repo_name" {
    value = aws_codecommit_repository.repo.repository_name
}

output "pipeline_name" {
    value = module.code_pipeline.pipeline_name
}

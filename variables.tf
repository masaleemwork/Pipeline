
variable "aws_region" {
  description = "Region in which the VPC will be placed"
  type        = string
  default     = "eu-west-2"
  validation {
    condition     = length(var.aws_region) > 0
    error_message = "Region must not be empty"
  }
}

variable "aws_sso_profile" {
  description = "Profile name for AWS SSO"
  type        = string
  default     = "moh"
}


variable "bucket_name" {
  description = "Bucket in which the Artifacts will be placed"
  type        = string
  default     = "pipeline-artifacts-moh"
  validation {
    condition     = length(var.bucket_name) > 0
    error_message = "Bucket name must not be empty"
  }
}


variable "repo_name" {
  description = "Repo in which the files will be placed"
  type        = string
  default     = "Pipeline-repo"
  validation {
    condition     = length(var.repo_name) > 0
    error_message = "Repo name must not be empty"
  }
}


variable "sc_account_id" {
  description = "Account ID of Service Catalog provisioning account"
  type        = string
  default     = "360104048680"
  validation {
    condition     = length(var.sc_account_id) > 0
    error_message = "SC account ID must not be empty"
  }
}

variable "product_name" {
  description = "The name of the product"
  type        = string
  default     = "MyProductYML"
}

variable "product_description" {
  description = "The description of the product"
  type        = string
  default     = "MyDescription"
}

variable "portfolio_name" {
  description = "The name of the portfolio"
  type        = string
  default     = "MyPortfolioYML"
}

variable "portfolio_provider" {
  description = "The provider of the portfolio"
  type        = string
  default     = "MyCompany"
}

variable "user_arn" {
  description = "The ARN of the user"
  type        = string
  default     = "arn:aws:iam::360104048680:user/TestUser"
}

variable "user_role" {
  description = "The role of the user"
  type        = string
  default     = "SCLaunch-ECSProduct"
}

variable "owner" {
  description = "The owner of the product"
  type        = string
  default     = "moh"
}

variable "distributor" {
  description = "The distributor of the product"
  type        = string
  default     = "MyDistributor"
}

variable "support_description" {
  description = "The description of product support"
  type        = string
  default     = "Product support descriptionYML"
}

variable "support_email" {
  description = "The email address for product support"
  type        = string
  default     = "support@example.com"
}

variable "support_url" {
  description = "The URL for product support"
  type        = string
  default     = "https://example.com/support"
}

variable "provisioning_name" {
  description = "The name of the provisioning"
  type        = string
  default     = "v1"
}

variable "provisioning_description" {
  description = "The description of the provisioning"
  type        = string
  default     = "Initial version"
}

variable "terraform_targz_file_path" {
  description = "The description of the provisioning"
  type        = string
  default     = "ECSTerraformCatalog.tar.gz"
}
locals {
  bucket_prefix_prefix = var.prefix == null ? "" : "${var.prefix}-"
}

module "code_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~>4.6.0"

  bucket_prefix = "${local.bucket_prefix_prefix}no-objects-plz"

  force_destroy = true
  tags = {
    module_verison = local.verison_map["code_bucket"]
  }
}

module "code_bucket_alternate" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~>4.6.0"

  providers = {
    aws = aws.alternate
  }

  bucket_prefix = "${local.bucket_prefix_prefix}no-objects-plz"

  force_destroy = true
  tags = {
    module_verison = local.verison_map["code_bucket"]
  }
}

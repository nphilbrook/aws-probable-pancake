module "code_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~>4.6.0"

  bucket_prefix = "no-objects-plz"
  force_destroy = true
  tags = {
    module_verison = local.verison_map["code_bucket"]
  }
}

module "code_bucket_doormat" {
  providers = {
    aws = aws.doormat
  }

  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~>4.6.0"

  bucket_prefix = "no-objects-plz"
  force_destroy = true
}

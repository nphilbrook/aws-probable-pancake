module "code_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~>4.6.0"

  bucket_prefix = "no-objects-please"
  force_destroy = true
}


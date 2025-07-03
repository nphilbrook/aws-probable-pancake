locals {
  tags_labels = {
    "created-by"       = "terraform",
    "source-workspace" = terraform.workspace
  }
}

provider "aws" {
  region = "us-west-2"
  alias  = "primary"
  default_tags {
    tags = local.tags_labels
  }
  shared_credentials_files = [var.tfc_vault_backed_aws_dynamic_credentials.default.shared_credentials_file]
}

provider "aws" {
  alias                    = "alternate"
  region                   = "us-east-1"
  shared_credentials_files = [var.tfc_vault_backed_aws_dynamic_credentials.aliases["620929731891"].shared_credentials_file]
}

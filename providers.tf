locals {
  tags_labels = {
    "created-by"       = "terraform",
    "source-workspace" = terraform.workspace
  }
}

provider "aws" {
  region = "us-west-2"
  default_tags {
    tags = local.tags_labels
  }
  # In the workspace variables
  # assume_role {
  #   role_arn = "arn:aws:iam::517068637116:role/dyn-ec2-access"
  # }
  shared_credentials_files = [var.tfc_vault_backed_aws_dynamic_credentials.default.shared_credentials_file]
}

provider "aws" {
  alias  = "doormat"
  region = "us-west-2"
  default_tags {
    tags = local.tags_labels
  }
  shared_credentials_files = [var.tfc_vault_backed_aws_dynamic_credentials.aliases["DOORMAT"].shared_credentials_file]
}


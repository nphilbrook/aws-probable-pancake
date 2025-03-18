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
  assume_role {
    role_arn = "arn:aws:iam::517068637116:role/dyn-ec2-access"
  }
}


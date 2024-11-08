terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version              = ">= 4.0.0"
      configuration_aliases = [aws.prod]
    }
  }
  required_version = ">= 1.0.0"
}
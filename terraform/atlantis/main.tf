locals {
  cidr = "10.10.0.0/16"
}

terraform {
  backend "s3" {
    bucket = "fjaijfidnanfodiai"
    key    = "atlantis"
  }
}

module "atlantis" {
  source  = "terraform-aws-modules/atlantis/aws"
  version = "3.23.1"
  # insert the 1 required variable here
  atlantis_repo_allowlist = ["github.com/wim-web/atlantis_test"]
  ecs_fargate_spot        = true
  cidr                    = "10.10.0.0/16"
  azs                     = ["ap-northeast-1a", "ap-northeast-1c"]
  private_subnets         = [cidrsubnet(local.cidr, 8, 1), cidrsubnet(local.cidr, 8, 2)]
  public_subnets          = [cidrsubnet(local.cidr, 8, 11), cidrsubnet(local.cidr, 8, 12)]

  route53_zone_name = "sandbox.torana.dev"

  atlantis_github_user           = "pien"
  atlantis_github_user_token     = var.pat
  atlantis_github_webhook_secret = var.webhook_secret

  allow_unauthenticated_access = true

  atlantis_image = "477235943564.dkr.ecr.ap-northeast-1.amazonaws.com/atlantis:latest"
}

variable "pat" {
  type = string
}

variable "webhook_secret" {
  type = string
}

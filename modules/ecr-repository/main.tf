provider "aws" {
  region = var.region
}

resource "aws_ecr_repository" "ecr_repository" {
  name = var.ecr_repository_name
}

output "repository_url" {
  value = aws_ecr_repository.ecr_repository.repository_url
}

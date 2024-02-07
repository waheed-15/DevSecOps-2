provider "aws" {
  region = var.region
}

resource "aws_iam_role" "eks_role" {
  name               = var.eks_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = {
        Service = "eks.amazonaws.com"
      }
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_role.arn



  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
    endpoint_public_access = var.endpoint_public_access
    endpoint_private_access = var.endpoint_private_access
  }

  tags = var.tags
}

resource "aws_iam_role" "node_role" {
  name = var.node_role_name
  assume_role_policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      },
      Action    = "sts:AssumeRole"
    }]
  })
}

output "node_role_arn" {
  value = aws_iam_role.node_role.arn
}

resource "aws_eks_node_group" "node_group" {
  cluster_name    = var.cluster_name
  node_group_name = var.node_group_name
  node_role_arn   = "aws_iam_role.node_role"
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = var.desired_capacity
    min_size     = var.min_size
    max_size     = var.max_size
  }

  instance_types = [var.instance_type]
}

output "node_group_name" {
  value = aws_eks_node_group.node_group.id
}


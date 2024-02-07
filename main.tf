provider "aws" {
  region = var.region
}

module "ecr" {
  region = var.region
  source                 = "./modules/ecr-repository"
  ecr_repository_name    = var.ecr_repository_name
}

module "eks" {
  region = var.region
  source                 = "./modules/eks-cluster"   
  eks_role_name          = var.eks_role_name
  cluster_name           = var.cluster_name
  subnet_ids             = var.subnet_ids
  security_group_ids     = var.security_group_ids
  endpoint_public_access = var.endpoint_public_access
  endpoint_private_access= var.endpoint_private_access
  node_role_name         = var.node_role_name
  node_group_name        = var.node_group_name
  desired_capacity       = var.desired_capacity
  min_size               = var.min_size
  max_size               = var.max_size
  instance_type          = var.instance_type
  tags = var.tags
}

output "ecr_repository_url" {
  value = module.ecr.repository_url
}

output "eks_node_role_arn" {
  value = module.eks.node_role_arn
}

output "eks_node_group_name" {
  value = module.eks.node_group_name
}

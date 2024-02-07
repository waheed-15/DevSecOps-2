region             = "add region"
eks_role_name      = "eks-role"
cluster_name       = "add your cluster name here"
subnet_ids         = ["subnet-1", "subnet-2", "subnet-3"]
security_group_ids = ["security grou ID"]
endpoint_public_access = true
endpoint_private_access = true
node_group_name           = "my-node-group"
instance_type             = "t2.medium"
min_size                  = 1
max_size                  = 1
desired_capacity          = 1
node_role_name            = "eks-node-role"
tags = {
  Environment = "Production"
  Project     = "MyProject"
}
ecr_repository_name = "my-ecr-repo"

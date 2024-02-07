region             = "us-east-1"
eks_role_name      = "eks-role"
cluster_name       = "my-eks-cluster"
subnet_ids         = ["subnet-0ab6ee277d0b523f8", "subnet-0c192bb582f2042c0", "subnet-0ab26cb3321e0c2ee"]
security_group_ids = ["sg-02cc70c89c7680abd"]
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
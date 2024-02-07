variable "region" {
  description = "AWS region"
}

variable "eks_role_name" {
  description = "Name of the IAM role for EKS"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "endpoint_public_access" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled"
  type        = bool
}

variable "endpoint_private_access" {
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled"
  type        = bool
}


variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}


##### NODE GROUP #####

variable "node_group_name" {
  description = "Name of the node group"
}

variable "node_role_name" {
  description = "Name of the node group"
}

variable "instance_type" {
  description = "EC2 instance type for nodes"
}

variable "min_size" {
  description = "Minimum number of nodes in the group"
}

variable "max_size" {
  description = "Maximum number of nodes in the group"
}

variable "desired_capacity" {
  description = "Desired number of nodes in the group"
}
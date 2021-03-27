variable "aws_region" {
  description = "Define AWS region"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "Define Kubernetes cluster name"
  type        = string
  default     = "eks_cluster"
}


provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    region         = "us-east-1"
    bucket         = "mtf-state-bucket"
    key            = "k8s-apps/terraform.tfstate"
    dynamodb_table = "mtf-project"
    encrypt        = true
  }
}

data "aws_eks_cluster" "cluster" {
  name = var.cluster_name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    command     = "aws"
    args = [
      "eks",
      "get-token",
      "--cluster-name",
      data.aws_eks_cluster.cluster.name
    ]
  }
}

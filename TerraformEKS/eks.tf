module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 20.0"
  cluster_name    = "my-eks-cluster"
  cluster_version = "1.32"

  cluster_endpoint_public_access = true

  vpc_id     = module.my-vpc.vpc_id
  subnet_ids = module.my-vpc.private_subnets

  tags = {
    environment = "development"
    application = "ArgoStream"
  }

  eks_managed_node_groups = {
    dev = {
      min_size     = 1
      max_size     = 3
      desired_size = 2

      instance_types = ["t2.small"]
    }
  }
}

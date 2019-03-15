provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {}
}

module "ecs" {
  source = "git@github.com:WestlyEdge/terraform-modules//modules//ecs"

  environment           = "${var.environment}"
  cluster_name          = "${var.cluster_name}"
  cloudwatch_prefix     = "${var.cluster_name}"
  vpc_cidr              = "${var.vpc_cidr}"
  public_subnet_cidrs   = "${var.public_subnet_cidrs}"
  private_subnet_cidrs  = "${var.private_subnet_cidrs}"
  availability_zones    = "${var.availability_zones}"
  max_size              = "${var.max_size}"
  min_size              = "${var.min_size}"
  desired_capacity      = "${var.desired_capacity}"
  key_pair_name         = "${var.key_pair_name}"
  key_pair_public_key   = "${var.key_pair_public_key}"
  instance_type         = "${var.instance_type}"
  ecs_aws_ami           = "${var.ecs_aws_ami}"
}
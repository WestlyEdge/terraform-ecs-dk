#!/bin/bash
set -e

# This script is intended to be run from an environment directory, e.g.
# config-dev-us-east-1.

# The remote state bucket name is determined by the current directory name.
BUCKET_NAME=dk-$(basename ${PWD})-remote-state-bucket

# This command configures your local directory to use remote state. You only
# need to run this once per environment
terraform init \
 -backend-config "bucket=${BUCKET_NAME}" \
 -backend-config "key=ecs-ecs-dk.tfstate" \
 -backend-config "region=us-east-1"
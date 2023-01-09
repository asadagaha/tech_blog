#!/bin/bash
set -e

COMMAND=$1
WORKSPACE=$2
OPTIONS=${@:3}

terraform fmt -recursive
terraform workspace select ${WORKSPACE}
terraform ${COMMAND} -var-file=.terraform/${WORKSPACE}.tfvars ${OPTIONS}
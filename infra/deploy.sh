#!/bin/bash
set -e

COMMAND=$1
WORKSPACE=$2
OPTIONS=${@:3}

terraform fmt -recursive
terraform workspace select ${WORKSPACE}
terraform ${COMMAND} -var-file=.terraform/${WORKSPACE}.tfvars ${OPTIONS} 

if [ $COMMAND = "apply" ]; then
    DB_HOST_OUTPUT="rds_cluster_endpoint"
    DB_HOST=`terraform output $DB_HOST_OUTPUT`
    if [[ $DB_HOST =~ "No outputs found" ]]; then
        echo "$DB_HOST_OUTPUT is not set."
    else
        gh secret set DB_HOST --body `echo $DB_HOST | sed 's/"//g'`
    fi
fi
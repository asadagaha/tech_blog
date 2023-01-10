#!/bin/bash
RDS_HOST=`terraform output $RDS_OUTPUT_ENDPOINT`
gh secret set `echo $RDS_HOST | sed 's/"//g'`
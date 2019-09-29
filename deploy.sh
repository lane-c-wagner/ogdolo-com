#!/bin/sh

aws s3 sync --acl public-read --delete build/ s3://ogdolo.com --profile ogdolo
aws cloudfront create-invalidation --distribution-id E1M9AZ4VGJC1LC --paths '/*' --profile ogdolo

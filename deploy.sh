#!/bin/sh

rm -r public
rm -r resources
hugo
aws s3 sync --acl public-read --delete public/ s3://ogdolo.com --profile ogdolo
aws cloudfront create-invalidation --distribution-id E1M9AZ4VGJC1LC --paths '/*' --profile ogdolo

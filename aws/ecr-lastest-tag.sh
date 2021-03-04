#! /bin/sh
# list latest tag

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 145742810091.dkr.ecr.us-east-1.amazonaws.com  &&

echo orders-management-api
aws ecr describe-images --repository-name orders-management-api --query 'sort_by(imageDetails,& imagePushedAt)[-1].imageTags[0]'


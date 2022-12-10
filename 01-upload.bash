#!/bin/bash
# aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 954231571588.dkr.ecr.us-east-1.amazonaws.com
set -ex
tag="954231571588.dkr.ecr.us-east-1.amazonaws.com/projects:latest"
docker build -t projects .
docker tag projects:latest "$tag"
docker push "$tag"
aws --region us-east-1 lambda update-function-code --function-name kirby --image-uri "$tag"
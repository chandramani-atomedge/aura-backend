#!/bin/bash
cd /home/ubuntu/my-app/
docker pull 270514764245.dkr.ecr.us-east-1.amazonaws.com/aura-app:latest
docker stop aura-app || true
docker rm aura-app || true
docker run -d --name my-app 270514764245.dkr.ecr.us-east-1.amazonaws.com/aura-app:latest
docker network create aura-network
docker run --name aura-app --hostname localhost --network aura-network -e "AWS_ACCESS_KEY_ID=AKIAT567PXHK6WVKNEOS3" -e "AWS_SECRET_ACCESS_KEY=9yZfLNgfLmMtIc+uERbDFw+jygll+MtjuX8rqWZKl" -e "OTP_API_KEY=5d7dbdd8-6498-11ef-8b60-0200cd936042" -p 80:80 -d 270514764245.dkr.ecr.us-east-1.amazonaws.com/aura-app:latest

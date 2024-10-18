#!/bin/bash
cd /home/ubuntu/my-app/
sudo apt update -y
sudo apt install unzip -y 
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
docker pull 270514764245.dkr.ecr.us-east-1.amazonaws.com/aura-app:latest
docker rm -f my-app || true

# Log in to AWS ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 270514764245.dkr.ecr.us-east-1.amazonaws.com
docker rm -f aura-app || true
NETWORK_NAME="aura-network"

# Check if the network already exists
if docker network ls --format '{{.Name}}' | grep -w "$NETWORK_NAME" > /dev/null; then
    echo "Network '$NETWORK_NAME' already exists."
else
    # Create the network if it doesn't exist
    docker network create "$NETWORK_NAME"
    echo "Network '$NETWORK_NAME' created."
fi
# docker run -d --name my-app 270514764245.dkr.ecr.us-east-1.amazonaws.com/aura-app:latest
docker run --name aura-app --hostname localhost --network aura-network -e "AWS_ACCESS_KEY_ID=AKIAT567PXHK6WVKNEOS3" -e "AWS_SECRET_ACCESS_KEY=9yZfLNgfLmMtIc+uERbDFw+jygll+MtjuX8rqWZKl" -e "OTP_API_KEY=5d7dbdd8-6498-11ef-8b60-0200cd936042" -p 8080:8080 -d 270514764245.dkr.ecr.us-east-1.amazonaws.com/aura-app:latest

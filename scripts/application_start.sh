#!/bin/bash
#!/bin/bash

# Define your ECR image and desired container name
ECR_IMAGE="333164040417.dkr.ecr.ap-south-1.amazonaws.com/my-php-app:latest"
CONTAINER_NAME="my-php-app"


# Step 1: Authenticate with ECR (ensure you have AWS credentials configured)
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 333164040417.dkr.ecr.ap-south-1.amazonaws.com
# Step 2: Pull the ECR image
docker pull 333164040417.dkr.ecr.ap-south-1.amazonaws.com/my-php-app:latest

# Step 3: Build and run the Docker container
sudo docker run -d --name $CONTAINER_NAME -p 8080:80 333164040417.dkr.ecr.ap-south-1.amazonaws.com/my-php-app:latest

# Optionally, you can check if the container is running
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "Container $CONTAINER_NAME is running."
else
    echo "Failed to start container."
fi
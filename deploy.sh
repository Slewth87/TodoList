#!/usr/bin/env bash
# Check for an already running instance
CURRENT_INSTANCE=$(sudo docker ps -a -q --filter ancestor="$IMAGE_NAME" --format="{{.ID}}")

# Stop the instance if there is one
if [ "$CURRENT_INSTANCE"]
then
    sudo docker rm $(sudo docker stop $CURRENT_INSTANCE)
filter

# Get instance from dockhub
sudo docker pull $IMAGE_NAME

# Check containers and remove if present
CONTAINER_EXISTS=$(sudo docker ps -a | grep $CONTAINER_NAME)
if [ "$CONTAINER_EXISTS" ]
then
    sudo docker rm $CONTAINER_NAME
fi

sudo docker run -p 3000:3000 -d --name $CONTAINER_NAME $IMAGE_NAME
#!/bin/bash
echo "start"

# Build the Docker image
docker build -t nodeejs . || { echo "Docker build failed"; exit 1; }

# Stop the existing container if it's running
docker stop nodeejs || true

# Run the Docker container
docker run --name nodeejs -d -p 3000:3000 --rm nodeejs:latest || { echo "Docker run failed"; exit 1; }

echo "end"

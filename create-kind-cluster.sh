#!/bin/bash

CLUSTER_NAME="flask-demo" # Replace with your cluster name
DOCKERFILE="Dockerfile" # Define the Dockerfile name

if kind get clusters | grep -q "^${CLUSTER_NAME}$"; then
    echo "Kind cluster '${CLUSTER_NAME}' already exists."
else
    echo "Kind cluster '${CLUSTER_NAME}' does not exist."
    kind create cluster --name flask-demo --config kind-config.yaml
fi

# Check if the Dockerfile exists in the current directory
if [ -f "$DOCKERFILE" ]; then
    echo "Dockerfile found in the current directory."
    docker build -t flask-hello:latest .
else
    echo "Dockerfile not found in the current directory."
    exit 1
fi
kind load docker-image flask-hello:latest --name flask-demo

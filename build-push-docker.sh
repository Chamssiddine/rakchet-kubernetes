#!/bin/bash

set -e

DOCKER_USER="chamseddinedocker"
BACKEND_IMAGE="$DOCKER_USER/backend"
FRONTEND_IMAGE="$DOCKER_USER/frontend"

# Build backend image
echo "🔨 Building backend image..."
docker buildx build --platform linux/amd64 -t $BACKEND_IMAGE ./backend

# Build frontend image
echo "🔨 Building frontend image..."
docker buildx build --platform linux/amd64 -t $FRONTEND_IMAGE ./frontend

# Push backend image
echo "📤 Pushing backend image..."
docker push $BACKEND_IMAGE

# Push frontend image
echo "📤 Pushing frontend image..."
docker push $FRONTEND_IMAGE

echo "✅ Done!"

#!/bin/bash

# Stop and remove all running containers
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)

# Remove all unused images
docker image prune -a --force

# Remove all unused volumes
docker volume prune --force

# Remove all unused networks
docker network prune --force

# Remove all unused build cache
docker builder prune --force

# Remove all dangling resources
docker system prune --force

# Remove all stopped containers, unused networks, and dangling images
docker system prune --volumes --force

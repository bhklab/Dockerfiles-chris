#!/bin/bash

## Documentation:
## https://docs.microsoft.com/en-us/azure/container-registry/container-registry-get-started-docker-cli?tabs=azure-cli
## https://docs.microsoft.com/en-us/azure/container-registry/container-registry-tutorial-quick-task

# NOTE: All <...> need to be replaced with real values!

# Login to Azure
az login

export ACR_NAME=bhklabbatch

# Login to container registry
az acr login --name $ACR_NAME

# Push to container registry
export AZ_REGISTRY=$ACR_NAME.azurecr.io

# Now tag your image with this repository like:
docker build \
    -f <Dockerfile_name> \
    -t $AZ_REGISTRY/<repo_name>/<image_name>

# Push to remote (requires upload, can be slow but is free)
docker push \
    $AZ_REGISTRY/<repo_name>/<image_name>

# Or build the image remotely (has compute costs)
az acr build \
    --registry $ACR_NAME \
    --image $AZ_REGISTRY/<repo_name>/<image_name> \
    -f <Dockerfile_name> \
    .
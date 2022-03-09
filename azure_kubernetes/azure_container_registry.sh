#!/bin/bash

## Documentation:
## https://docs.microsoft.com/en-us/azure/container-registry/container-registry-get-started-docker-cli?tabs=azure-cli

# Login to Azure
az login

export AZ_REG_NAME=bhklabbatch

# Login to container registry
az acr login --name $AZ_REG_NAME

# Push to container registry
export AZ_REGISTRY=$AZ_REG_NAME.azurecr.io

# Now tag your image with this repository like:
docker -t $AZ_REGISTRY/<repo_name>/<image_name>

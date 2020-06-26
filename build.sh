#!/bin/bash

echo "Building Seldon Image from $BRANCH_NAME"
echo "Repo Name $REPO_NAME"
# if [[ "$BRANCH_NAME" == "develop" ]]
# then
# docker build . -t gcr.io/granular-ai/$REPO_NAME:$SHORT_SHA -t gcr.io/granular-ai/$REPO_NAME:latest --cache-from gcr.io/granular-ai/$REPO_NAME:latest"
#!/bin/bash

echo "Hello from Bash"
VERSION=`cat VERSION`
echo $BUILD
echo $PROJECT
echo $BRANCH
echo $NAME
echo $VERSION
if [[ $BRANCH == 'develop' ]]; then
    echo "Building Nightly version"
    docker build . -t gcr.io/granular-ai/$NAME:$SHORT_SHA -t gcr.io/granular-ai/$NAME:nightly --cache-from gcr.io/granular-ai/$NAME:nightly 
else
    echo "Building Stable version"
    docker build . -t gcr.io/granular-ai/$NAME:$SHORT_SHA -t gcr.io/granular-ai/$NAME:latest -t gcr.io/granular-ai/$NAME:stable  -t gcr.io/granular-ai/$NAME:$VERSION --cache-from gcr.io/granular-ai/$NAME:nightly 
fi
    
docker push gcr.io/granular-ai/$NAME
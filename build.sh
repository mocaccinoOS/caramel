#!/bin/bash


bundle=$1
image_prefix=$2
if [ -z "$bundle" ]; then
    echo "Bundle name required"
    exit 1
fi

if [ -z "$image_prefix" ]; then
    echo "image_prefix prefix required"
    exit 1
fi

shift 
shift

echo "Creating bundle $bundle with args $@"
image_name="${image_prefix}:${bundle}"

if [ ! -d build ]; then
    mkdir build
fi

# Build docker image
docker build -t $image_name $bundle

# Build statically compiled version
export CGO_ENABLED=0
poco bundle \ 
    --image $image_name --local \
    --output build/$bundle \
    $@
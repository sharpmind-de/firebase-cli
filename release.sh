IMAGE_NAME=sharpmind/firebase-cli
TAG=latest

docker tag $IMAGE_NAME:$TAG $REGISTRY/$IMAGE_NAME:$TAG
docker push $IMAGE_NAME:$TAG

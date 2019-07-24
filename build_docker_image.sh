REGISTRY=kycfeel/dockerized-apt-mirror
VERSION=$(cat ./version)

docker build -t $REGISTRY:$VERSION -t $REGISTRY:latest . 

docker push $REGISTRY:$VERSION 
docker push $REGISTRY:latest

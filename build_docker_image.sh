REGISTRY=kycfeel/dockerized-apt-mirror
VERSION=$(cat ./version)

docker build -t $REGISTRY:$VERSION .

docker push $REGISTRY:$VERSION
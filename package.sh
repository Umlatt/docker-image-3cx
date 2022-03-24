#!/bin/bash
version=$1
if [[ $version ]];
then
    docker build -t umlatt/3cx:$version .
else
    printf "Version number required.\ne.g.\t$0 1.0.2\n"
fi
docker run -dit --name threecx.$version umlatt/3cx:$version
docker exec -it threecx.$version bash
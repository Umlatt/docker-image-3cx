#!/bin/bash
version=$1
path=$2 
if [[ ! $path ]]; then path='.'; fi
if [[ $version ]];
then
    docker build -t umlatt/3cx:$version $path
else
    printf "Version number required.\ne.g.\t$0 1.0.2\n"
fi
docker run -dit --network host --name threecx.$version umlatt/3cx:$version
docker exec -it threecx.$version bash
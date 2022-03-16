#!/bin/bash
printf "Stopping container\n"
docker stop deleteme
printf "Deleteing container container\n"
docker rm deleteme
printf "Stopping container\n"
for image in `docker image list -q`
do 
    docker rmi $image
done
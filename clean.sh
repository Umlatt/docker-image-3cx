#!/bin/bash
for container in `docker ps -q`; do docker stop $container; docker rm $container; done
for image in `docker image list -q | grep -v 682f678c3fa0`; do docker rmi $image; done
docker image list
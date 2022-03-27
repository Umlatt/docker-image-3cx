#!/bin/bash
for container in `docker ps -q -a`; do docker stop $container; docker rm $container; done
for image in `docker image list -q | grep -v 682f678c3fa0 | grep -v 71d646d8e086`; do docker rmi $image; done
docker image list
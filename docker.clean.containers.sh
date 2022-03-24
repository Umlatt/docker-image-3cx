#!/bin/bash
for container in `docker ps -q`; do docker stop $container; docker rm $container; done
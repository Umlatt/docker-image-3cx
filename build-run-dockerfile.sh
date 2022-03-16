#!/bin/bash
printf "Building image\n"
docker build -t umlatt/3cx .
printf "Run container - (i)nteractive,(t)ty,(d)etach\n"
docker run --name deleteme -dit umlatt/3cx
# Filename: Dockerfile
# Set base image for container
FROM debian:10-slim
# Set details for image/container 
LABEL version="0.1-beta"
LABEL description="A custom 3cx pbx implementation for running on Jelastic platforms."
# Ensure that build is running most up-to-date packages
RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y 

CMD ["/usr/bin/wc","--help"]
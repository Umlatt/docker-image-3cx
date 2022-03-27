# Filename: Dockerfile
# Set base image for container
FROM debian:10-slim
# Set details for image/container 
LABEL version="0.1.x-beta"
LABEL description="A custom 3cx pbx implementation for running on Jelastic platforms."
#ENV DEBIAN_FRONTEND noninteractive
# Ensure that build is running most up-to-date packages
RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y
# Install dependancies
RUN apt-get install -y apt-utils systemd locales gnupg2 wget
# Install requirements & 3cx services
RUN wget -O- http://downloads-global.3cx.com/downloads/3cxpbx/public.key | apt-key add -
RUN echo "deb http://downloads-global.3cx.com/downloads/debian buster main" | tee /etc/apt/sources.list.d/3cxpbx.list
RUN apt-get update && apt-get install -y net-tools dphys-swapfile
RUN apt-get install -y $(apt-cache depends 3cxpbx | grep Depends | sed "s/.*ends:\ //" | tr '\n' ' ')
#RUN apt-get install -y 3cxpbx

EXPOSE 5015/tcp 5001/tcp 5060/tcp 5060/udp 5061/tcp 5090/tcp 5090/udp 9000-9500/udp

CMD ["/lib/systemd/systemd"]
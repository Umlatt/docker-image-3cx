# Filename: Dockerfile
FROM debian:10-slim

LABEL version="0.1-beta"
LABEL description="A custom 3cx pbx implementation for running on Jelastic platforms."

CMD ["/usr/bin/wc","--help"]
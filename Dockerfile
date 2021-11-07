FROM docker.io/library/debian:unstable

ENV NAME=debian-toolbox VERSION=unstable
LABEL com.github.containers.toolbox="true" \
      com.github.debarshiray.toolbox="true" \
      name="$NAME" \
      version="$VERSION" \
      usage="This image is meant to be used with the toolbox command" \
      summary="Base image for creating Debian sid toolbox containers" 

# Setup Install Location
RUN mkdir -p /tos-Install
ADD scripts/ /tos-Install
RUN cd /tos-Install; chmod +x *.sh

RUN /tos-Install/setup-tos.sh

CMD ["/bin/sh"]
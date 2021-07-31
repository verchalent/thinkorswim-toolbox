FROM docker.io/library/debian:unstable

ENV NAME=debian-toolbox VERSION=unstable
LABEL com.github.containers.toolbox="true" \
      com.github.debarshiray.toolbox="true" \
      name="$NAME" \
      version="$VERSION" \
      usage="This image is meant to be used with the toolbox command" \
      summary="Base image for creating Debian sid toolbox containers" 



RUN apt update && apt -y upgrade

RUN apt -y install \
	git \
	gnupg \
	keyutils \
	sudo \
	time \
	wget \
	zsh 

RUN sed -i -e 's/ ALL$/ NOPASSWD:ALL/' /etc/sudoers

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xB1998361219BD9C9
RUN echo 'deb http://repos.azulsystems.com/debian stable main' | sudo tee -a /etc/apt/sources.list
RUN apt update
RUN apt -y install zulu-11

RUN apt clean

#previously built manually - needs testing
RUN wget https://mediaserver.thinkorswim.com/installer/InstFiles/thinkorswim_installer.sh /
RUN chmod +x /thinkorswim_installer.sh
RUN /thinkorswim_installer.sh

RUN echo VARIANT_ID=container >> /etc/os-release
RUN touch /etc/localtime

CMD /bin/sh
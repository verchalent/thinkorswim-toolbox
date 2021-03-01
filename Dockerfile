FROM docker.io/library/debian:unstable

ENV NAME=debian-toolbox VERSION=unstable
LABEL com.github.containers.toolbox="true" \
      com.github.debarshiray.toolbox="true" \
      name="$NAME" \
      version="$VERSION" \
      usage="This image is meant to be used with the toolbox command" \
      summary="Base image for creating Debian sid toolbox containers" 



RUN apt update

RUN apt -y upgrade

RUN apt -y install \
	bash-completion \
	git \
	gnupg \
	keyutils \
	libcap2-bin \
	lsof \
	man-db \
	mlocate \
	mtr \
	rsync \
	sudo \
	tcpdump \
	time \
	traceroute \
	tree \
	unzip \
	wget \
	zip \
	zsh 

RUN sed -i -e 's/ ALL$/ NOPASSWD:ALL/' /etc/sudoers

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xB1998361219BD9C9
RUN echo 'deb http://repos.azulsystems.com/debian stable main' | sudo tee -a /etc/apt/sources.list
RUN apt update
RUN apt -y install zulu-8

RUN apt clean

RUN echo VARIANT_ID=container >> /etc/os-release
RUN touch /etc/localtime

CMD /bin/sh

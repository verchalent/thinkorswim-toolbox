#!/bin/bash

# Update apt cache and upgrade 
apt update && apt -y upgrade

# Install requirements
packagelist=(
	git
	gnupg
	keyutils
	sudo
	time
	wget
	zsh
)

apt install -y ${packagelist[@]}

# Add users to sudoers
sed -i -e 's/ ALL$/ NOPASSWD:ALL/' /etc/sudoers

# Add Zulu Java repo and install latest
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xB1998361219BD9C9
echo 'deb http://repos.azulsystems.com/debian stable main' | sudo tee -a /etc/apt/sources.list
apt update
apt -y install zulu-11

# Cleanup
apt autoclean -y && apt autoremove -y --purge && rm -rf /var/lib/apt/lists/* && apt clean -y

# Install TOS
wget https://mediaserver.thinkorswim.com/installer/InstFiles/thinkorswim_installer.sh ./
chmod +x /thinkorswim_installer.sh
./thinkorswim_installer.sh

echo VARIANT_ID=container >> /etc/os-release
touch /etc/localtime
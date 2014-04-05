# DOCKER-VERSION 0.3.4
FROM    ubuntu

MAINTAINER Charles Nguyen <chuckleb@gmail.com>

# Add multiverse for crafty
RUN		echo "deb http://us.archive.ubuntu.com/ubuntu/ precise multiverse" >> /etc/apt/sources.list

# Run updates and install base libs & tools
RUN 	apt-get -y update
RUN		DEBIAN_FRONTEND=noninteractive apt-get -y install build-essential libx11-dev libglu-dev wget expect php5-curl php5-json libfpdi-php

# Install benchmark packages
RUN		DEBIAN_FRONTEND=noninteractive apt-get -y install hardinfo crafty phoronix-test-suite
RUN 	wget http://forums.servethehome.com/pjk/STHbench.sh && chmod +x STHbench.sh

# Exeute test
ENTRYPOINT	["/STHbench.sh"]

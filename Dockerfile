# DOCKER-VERSION 0.3.4
FROM    ubuntu

MAINTAINER Charles Nguyen <chuckleb@gmail.com>

#install required repos, run updates, install packages
RUN	echo "deb http://us.archive.ubuntu.com/ubuntu/ precise multiverse" >> /etc/apt/sources.list
RUN 	apt-get -y update && sudo apt-get -y upgrade
RUN	apt-get -y install build-essential libx11-dev libglu-dev hardinfo crafty wget phoronix-test-suite expect php5-curl php5-json libfpdi-php
RUN 	wget http://forums.servethehome.com/pjk/STHbench.sh && chmod +x STHbench.sh
#ENTRYPOINT	["/STHbench.sh"]

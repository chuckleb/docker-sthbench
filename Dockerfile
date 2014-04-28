# DOCKER-VERSION 0.3.4
FROM    ubuntu

MAINTAINER Charles Nguyen <chuckleb@gmail.com>

# Turn off intaractive mode to reduce noise and errors
ENV	DEBIAN_FRONTEND noninteractive
ENV	DOCKER	TRUE

# Update path to include /usr/games for crafty test
ENV	PATH	/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

# Add multiverse for crafty
RUN	echo "deb http://us.archive.ubuntu.com/ubuntu/ trusty multiverse" >> /etc/apt/sources.list

# Run updates and install base libs & tools
RUN 	apt-get -y update
RUN	apt-get -y install build-essential libx11-dev libglu-dev hardinfo sysbench unzip expect \
	php5-curl php5-common php5-cli php5-gd libfpdi-php gfortran wget cmake

# Install benchmark packages
RUN	apt-get -y install hardinfo crafty
RUN	wget -N http://phoronix-test-suite.com/releases/repo/pts.debian/files/phoronix-test-suite_4.8.6_all.deb &&\
	dpkg -i phoronix-test-suite_4.8.6_all.deb &&\
	rm phoronix-test-suite_4.8.6_all.deb
RUN	wget https://raw.githubusercontent.com/STH-Dev/STHbench.sh/master/STHbench-Dev012.09.sh &&\
	chmod +x STHbench-Dev012.09.sh
#	sudo ./STHbench-Dev012.06.sh

# Exeute test
ENTRYPOINT	["/STHbench-Dev012.09.sh"]

# DOCKER-VERSION 0.3.4
FROM    ubuntu

MAINTAINER Charles Nguyen <chuckleb@gmail.com>

# Turn off intaractive mode to reduce noise and errors
ENV	DEBIAN_FRONTEND noninteractive
ENV	DOCKER	TRUE

# Update path
ENV	PATH	/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Run updates and install base libs & tools
RUN 	apt-get -y update
RUN	apt-get -y install build-essential libx11-dev libglu-dev hardinfo sysbench unzip expect \
	php5-curl php5-common php5-cli php5-gd libfpdi-php gfortran wget cmake libncurses5-dev

# This will force it to pull latest script and execute
CMD ["-c", "wget https://raw.githubusercontent.com/STH-Dev/STHbench.sh/master/STHbench-Dev012.11.sh;chmod a+x *.sh ;./STHbench-Dev012.11.sh"]
ENTRYPOINT ["/bin/bash"]

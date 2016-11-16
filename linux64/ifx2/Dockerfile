#
# Docker File for building Informix Docker Image 
#

FROM ifxbase:latest
MAINTAINER InformixTeam

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# copy to root dir
COPY    iif.12.10.tar informix_install.sh  /  

RUN     bash ./informix_install.sh iif.12.10.tar \
        && rm iif.12.10.tar

RUN 	echo "%sudo ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Informix SQLEXEC, Mongo, REST
# Save some time on rebuild by placing it above some
# files that may change
EXPOSE  9088 27017 27018 27883
VOLUME 	["/home/informix/data"]

# Adding these after install so we can reuse cached image of installed informix.
# copy to root dir
ADD	informix_start.sh \
	informix_stop.sh \
		/ 

USER 	informix
# Using [] form so we don't get an extra shell
ENTRYPOINT ["/bin/bash", "informix_start.sh"]

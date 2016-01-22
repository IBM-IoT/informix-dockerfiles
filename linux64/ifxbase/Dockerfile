#
#  url: 	https://github.com/0x1fff/docker-informix
#

FROM debian:wheezy
MAINTAINER IfxTeam
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

ADD	ifxbase_install.sh .
ADD	ifxbase2_install.sh .
RUN	bash ifxbase_install.sh
RUN	bash ifxbase2_install.sh


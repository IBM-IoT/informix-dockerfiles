#!/bin/bash

#  name:        ifxbase_install.sh:
#  description: Packages require for informix install
#
#  Detailed Description:
#   - Upgrades Debian based system and fetches Informix dependencies
#

# Delete downloaded data including packages
DO_CLEANUP="YES"

##
## Changing lines below at your own risk!
##

echo "###############################################"
echo "# Debian base for Informix                    #"
echo "###############################################"


function myfatal {
	if [ "${1}" -ne 0 ] ; then
		echo "${2}" >&2
		exit $1
	fi
}

# Get DISTRIB_DESCRIPTION
DISTRIB_DESCRIPTION=`uname -a`
KERNEL_VERSION=`uname -a`
if [ -e /etc/lsb-release ] ; then
	. /etc/lsb-release
elif [ -e /etc/debian_version ] ; then
	DISTRIB_DESCRIPTION="Debian "`cat /etc/debian_version`
fi

echo ">>>    OS version: ${DISTRIB_DESCRIPTION}"
echo ">>>    Linux Kernel version: ${KERNEL_VERSION}"
echo ">>>    Upgrading OS and installing dependencies for Informix ${IFXDB_VERSION}"

# Installtion for Wire Listener

apt-get update -qy
myfatal $? "apt-get update failed"
apt-get install -qy openjdk-7-jre
myfatal $? "apt-get install openjdk-7-jre failed"
apt-get install -qy net-tools
myfatal $? "apt-get install net-tools(netstat) failed"

if [ "${DO_CLEANUP}" == "YES" ] ; then
	echo ">>>    Deleting downloaded packages"
	rm -rf /var/lib/apt/lists/*
	myfatal $? "rm /var/lib/apt/lists/ failed"
	rm -rf /var/cache/apt/archives/*
	myfatal $? "rm /var/cache/apt/archives/ failed"
fi
echo "################################################"
echo "# Debian base Installation completed           #"
echo "################################################"

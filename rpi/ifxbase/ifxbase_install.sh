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
apt-get update  -qy
myfatal $? "apt-get update failed"
apt-get upgrade -qy
myfatal $? "apt-get upgrade failed"
apt-get install -qy apt-utils adduser file sudo
myfatal $? "apt-get install apt-utils adduser file"
apt-get install -qy libaio1 bc pdksh libncurses5 ncurses-bin libpam0g
myfatal $? "apt-get dependencies failed"
apt-get install -qy curl
myfatal $? "apt-get curl failed"
apt-get install -qy vim
myfatal $? "apt-get vim failed"


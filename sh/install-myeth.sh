#! /bin/bash
# Install offline MyEtherWallet
# Created by h8rt3rmin8r on 20180526

# Establish variables
USER="`sudo echo ${HOME} | cut -c 7-`"
TODAY="`date '+%Y%m%d' | head -c -1`"
NOW="`date '+%Y%m%d-%H%M%S' | head -c -1`"

# Verify root access
uid=`id -u $USERNAME`

if [ "$uid" == "0" ]
    then
        echo ""
        echo "INSTALL: User is root"
        echo "         Beginning installation process..."
        echo ""
    else
        echo ""
        echo "INSTALL: You need to have root access, run again with 'sudo'"
    exit 1
fi
echo ""
echo ${NOW}" -- Installation process started..."
echo ""

# Update the package list and install system updates
apt-get update
apt-get -y upgrade
apt-get -y dist-upgrade

# INSTALL: curl
apt-get install -y curl

# INSTALL: wget
apt-get install -y wget

# INSTALL: dos2unix
apt-get install -y dos2unix

# INSTALL: unzip
apt-get install -y unzip

# INSTALL: jq
apt-get install -y jq

# INSTALL: jq
apt-get install -y lynx

# Update the package list
apt-get update

# Setup core files and construct directories
cd ${HOME}/
mkdir -p ${HOME}/.software
mkdir -p ${HOME}/.software/myeth
# Remove old repo versions
rm -rf ${HOME}/.software/myeth
mkdir ${HOME}/.software/myeth
cd ${HOME}/.software/myeth
# Remove old bin versions
mkdir -p /usr/local/bin/myeth-source
rm -rf /usr/local/bin/myeth-source


curl -s 'https://github.com/kvhnuke/etherwallet/releases/latest' \
	> version.html
echo "" \
	>> version.html

# Extract the version link
lynx -dump -nonumbers -minimal version.html | tail -1 \
	> version.txt

# Build the download link
DOWNLOAD="https://github.com/kvhnuke/etherwallet/archive/"
VERSION="`cat version.txt | cut -c 53-`"
VERSION_ZIP="${VERSION}.zip"
LATEST="${DOWNLOAD}${VERSION_ZIP}"
UNZIPPED="etherwallet-`cat version.txt | cut -c 54-`"

# Download the nova-calculator repository archive
wget --timeout=10 -q ${LATEST}

# Unzip the downloaded archive
# Outputs '${UNZIPPED}'
unzip -qq ${VERSION_ZIP}

# Create path reference
touch myeth.sh
echo '#! /bin/bash' > myeth.sh
echo '# Open offline html' >> myeth.sh
echo 'xdg-open /usr/local/bin/myeth-source/dist/index.html' >> myeth.sh
chmod +x myeth.sh
mv myeth.sh myeth; mv myeth /usr/local/bin/myeth

mkdir -p /usr/local/bin/myeth-source
mv ${HOME}/.software/myeth/${UNZIPPED}/dist /usr/local/bin/myeth-source
rm -rf ${UNZIPPED}
rm ${VERSION_ZIP}

# Create the log
mkdir -p ${HOME}/.software/myeth/logs/
touch ${HOME}/.software/myeth/logs/${TODAY}.log
sudo chown -R ${USER}:${USER} ${HOME}/.software/

# Exit installation script
echo ${TODAY}" -- Installation complete!" > ${HOME}/.software/myeth/logs/${TODAY}.log
echo ""
echo ${NOW}" -- Installation complete!"
echo "run with 'myeth'"
echo ""
exit

################################################################################
                                                   #                           #
                                                   #  "think outside the box"  #
                                                   #                           #
                                                   #    ($) ¯\_(ツ)_/¯ (฿)     #
                                                   #                           #
                                                   #############################

#! /bin/bash
################################################################################
#  INSTALL LINUX ESSENTIALS  #
##############################
#
#   install-linux-essentials.sh - (Version 1.0.7)
#   See changes in the "updates log" at the end of this file
#
# ---------------------------# ATTRIBUTION #------------------------------------
#
#   AUTHOR:     h8rt3rmin8r
#   DATE:       20180416
#   EMAIL:      161803398@email.tg
#   PGP:        https://h8rt3rmin8r.com
#   SOURCE-1:	https://pastebin.com/raw/Ls5JuEGH
#   SOURCE-2:   https://h8rt3rmin8r.com/sh/install-linux-essentials.sh
#
# ---------------------------# DESCRIPTION #------------------------------------
#
#   This script is intended to be run inside a fresh Ubuntu installation. The
#   script will download and install all top recommended packages and programs
#   not already bundled with the core Ubuntu OS. Additionally, this script will
#   download and make available several useful shell scripts that can be used
#   to facilitate several common features and functions.
#
#   This script is ready to be used in a headless server out of the box. To 
#   enable the installation of graphical utilities and software, simply 
#   uncomment the items in the "graphical software" section as desired.
#
# ---------------------------# INSTRUCTIONS #-----------------------------------
#
#   Enable execution of this script by navigating to the directory in which this
#   script is located and run the following command:
#
#       sudo chmod +x install-linux-essentials.sh
#
#   Now you must become the root user in order to perform the actions contained
#   in this script. Do so with the following command:
#
#       sudo -s
#
#   You may be asked to type in your password after issuing the command above.
#   Now you just need to execute this script with the following command:
#
#       ./install-linux-essentials.sh
#
# ---------------------------# OVERVIEW #---------------------------------------
#
# [ PHASE 1 ] - INITIAL SETUP
#
#   Initial setup of the environment in preparation for upcoming installations
#
# [ PHASE 2 ] - PACKAGES INSTALLED
#
#   Installation of all non-graphical software packages
#
#   curl        (Command line URL tool)
#   wget        (The non-interactive network downloader)
#   bc          (An arbitrary precision calculator language)
#   wscat       (Communicate over websocket)
#   gcsfuse     (Google Cloud Storage utility)
#   apache2     (Web Server)
#   jq          (JSON Utility)
#   htop        (Interactive process viewer)
#   html2text   (HTML to text conversion tool)
#   dos2unix    (DOS/Mac to Unix text file format converter)
#   xmlstarlet  (Command line XML/XSLT toolkit)
#   nmap        (Network mapping tool)
#   arp-scan    (The classic ARP scanner)
#   lynx        (Command line web browser)
#   git         (Repository management utility)
#   unzip       (The unzip tool for extracting zipped directories)
#   tree        (Directory tree viewer)
#   virtualenv  (Python virtual environment creator and management tool)
#   gdebi       (Simple tool to install deb files)
#   gcloud      (Google Cloud SDK) #Uncomment to enable installation!
#
# [ PHASE 3 ] - OPTIONAL GRAPHICAL SOFTWARE
#
#   Installation of graphical software packages
#
#   code        (Visual Studio Code - an essential IDE created by Microsoft)
#
# [ PHASE 4 ] - SHELL SCRIPTS DOWNLOADED
#
#   Downloading and enabling additional bash scripts
#
#   fix-gcloud-key  (Fix expired Google Cloud Shell expired keys error)
#   checkip         (Check your system IP address)
#   btcusd          (Check the current bitcoin/USD exchange rate)
#   nova            (Calculate floating point arithmetic in the terminal)
#
################################################################################
#  FUNCTIONS  #
###############

# [ PHASE 1 ] ------------------------------------------------------------------
#
#   Initial setup of the environment in preparation for upcoming installations
#
#-------------------------------------------------------------------------------

# DATE-TIME VARIABLE
DT="`date '+%Y%m%d-%H%M%S'`"

echo "[ install-linux-essentials.sh ]: BEGINNING PROCESSES..."

# VERIFY ROOT ACCESS
uid=`id -u $USERNAME`

if [ "$uid" == "0" ]
    then
        echo "[ install-linux-essentials.sh ]: User is root"
    else
        echo "[ install-linux-essentials.sh ]: You need to have root access, run again in sudo"
    exit 1
fi

# MOVE TO HOME DIRECTORY AND CREATE HIDDEN DIRECTORY ".sh"
cd ${HOME}
mkdir .sh && cd .sh
mkdir install-linux-essentials && cd install-linux-essentials
touch install-linux-essentials.log
echo ${DT}" -- Beginning processes as root user" > ~/.sh/install-linux-essentials/install-linux-essentials.log
echo ${DT}" -- Updating package list and installing initial system updates" >> ~/.sh/install-linux-essentials/install-linux-essentials.log
echo "[ install-linux-essentials.sh ]: Updating package list and installing initial system updates"

# UPDATE THE PACKAGE LIST & INSTALL UPDATES
apt-get update
apt-get -y upgrade
apt-get -y dist-upgrade

# [ PHASE 2 ] ------------------------------------------------------------------
#
#   Installation of all non-graphical software packages
#
#-------------------------------------------------------------------------------

echo ${DT}" -- Installing non-graphical software packages..." >> ~/.sh/install-linux-essentials/install-linux-essentials.log
echo "[ install-linux-essentials.sh ]: 'Installing non-graphical software packages...'"

# INSTALL: CURL
apt-get install -y curl

# INSTALL: WGET
apt-get install -y wget

# INSTALL: BC
apt-get install -y bc

# INSTALL: WSCAT
apt install -y node-ws

# INSTALL: GOOGLE CLOUD STORAGE UTILITY (gcsfuse)
export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s`
echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" | sudo tee /etc/apt/sources.list.d/gcsfuse.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-get install -y gcsfuse

# INSTALL: APACHE2
apt-get install -y apache2

# INSTALL: JQ
apt-get install -y jq

# INSTALL: HTOP
apt-get install -y htop

# INSTALL: HTML2TEXT
apt-get install -y html2text

# INSTALL: DOS2UNIX
apt-get install -y dos2unix

# INSTALL: XMLSTARTLET
apt-get install -y xmlstarlet

# INSTALL: NMAP
apt-get install -y nmap

# INSTALL: ARP-SCAN
apt-get install -y arp-scan

# INSTALL: LYNX
apt-get install -y lynx

# INSTALL: GIT
apt-get install -y git

# INSTALL: UNZIP
apt-get install -y unzip

# INSTALL: TREE
apt-get install -y tree

# INSTALL: VIRTUALENV
apt-get install -y virtualenv

# INSTALL: GDEBI
apt-get install -y gdebi

# INSTALL: GOOGLE CLOUD SDK
# Uncomment the following line to enable installation
#curl https://sdk.cloud.google.com | bash

# FINISH PHASE 2 BY UPDATING THE PACKAGE LIST
apt-get update

echo ${DT}" -- Non-graphical software has been installed successfully!" >> ~/.sh/install-linux-essentials/install-linux-essentials.log
echo "[ install-linux-essentials.sh ]: Non-graphical software has been installed successfully!"

# [ PHASE 3 ] ------------------------------------------------------------------
#
#   Installation of graphical software packages
#   UNCOMMENT THE APPROPRIATE SECTIONS TO ENABLE INSTALL
#
#-------------------------------------------------------------------------------

# INSTALL: VISUAL STUDIO CODE
#curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
#sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
#sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
#apt-get update && apt-get install -y code

# [PHASE 4 ] -------------------------------------------------------------------
#
#   Downloading and enabling additional bash scripts
#
#-------------------------------------------------------------------------------

echo ${DT}" -- Downloading and enabling additional bash scripts..." >> ~/.sh/install-linux-essentials/install-linux-essentials.log
echo "[ install-linux-essentials.sh ]: Downloading and enabling additional bash scripts..."

cd ~/.sh

# CREATE AND ENABLE "fix-gcloud-key"
# Description: Repair outdated Google Cloud PGP keys when they expire
wget https://pastebin.com/raw/KEh8dfFk
touch fix-gcloud-key
mv KEh8dfFk fix-gcloud-key
chmod +x fix-gcloud-key && cp fix-gcloud-key /usr/local/bin/fix-gcloud-key
dos2unix -k -o /usr/local/bin/fix-gcloud-key

# CREATE AND ENABLE "checkip"
# Description: 
wget https://pastebin.com/raw/yhV0nTH4
touch checkip
mv yhV0nTH4 checkip
chmod +x checkip && cp checkip /usr/local/bin/checkip
dos2unix -k -o /usr/local/bin/checkip

# CREATE AND ENABLE "btcusd"
# Description: 
wget https://pastebin.com/raw/wZTWNkhd
touch btcusd
mv wZTWNkhd btcusd
chmod +x btcusd && cp btcusd /usr/local/bin/btcusd
dos2unix -k -o /usr/local/bin/btcusd

# CREATE AND ENABLE "nova"
# Description: Calculate floating point arithmetic in the terminal
wget https://pastebin.com/raw/61fHwRCC
touch install-nova.sh
mv 61fHwRCC install-nova.sh
chmod +x install-nova.sh
dos2unix -k -o install-nova.sh
sudo ./install-nova.sh

echo ${DT}" -- Additional bash scripts have been installed successfully!" >> ~/.sh/install-linux-essentials/install-linux-essentials.log
echo "[ install-linux-essentials.sh ]: Additional bash scripts have been installed successfully!"

echo ${DT}" -- ALL PROCESSES COMPLETE!" >> ~/.sh/install-linux-essentials/install-linux-essentials.log
echo "Read the logs at ~/.sh/install-linux-essentials/install-linux-essentials.log" >> ~/.sh/install-linux-essentials/install-linux-essentials.log
echo "Email questions to h8rt3rmin8r at 161803398@email.tg" >> ~/.sh/install-linux-essentials/install-linux-essentials.log
echo "New commands available:" >> ~/.sh/install-linux-essentials/install-linux-essentials.log
echo "--------------------------------------------------------------------------" >> ~/.sh/install-linux-essentials/install-linux-essentials.log
echo "'fix-gcloud-key'  (Repair outdated Google Cloud PGP keys when they expire)" >> ~/.sh/install-linux-essentials/install-linux-essentials.log
echo "'checkip'         (Check your system's public IP address)" >> ~/.sh/install-linux-essentials/install-linux-essentials.log
echo "'btcusd'          (Check the current bitcoin/USD exchange rate)" >> ~/.sh/install-linux-essentials/install-linux-essentials.log
echo "'nova'            (Calculate floating point arithmetic in the terminal)" >> ~/.sh/install-linux-essentials/install-linux-essentials.log
echo "--------------------------------------------------------------------------" >> ~/.sh/install-linux-essentials/install-linux-essentials.log
echo "exiting script..." >> ~/.sh/install-linux-essentials/install-linux-essentials.log

# EXIT ROOT USER AND RETURN TO HOME
cd ${HOME}
echo ""
echo "[ install-linux-essentials.sh ]: ALL PROCESSES COMPLETE!"
echo "Read the logs at ~/.sh/install-linux-essentials/install-linux-essentials.log"
echo "Email questions to h8rt3rmin8r at 161803398@email.tg"
echo ""
echo "New commands available:"
echo "--------------------------------------------------------------------------"
echo "'fix-gcloud-key'  (Repair outdated Google Cloud PGP keys when they expire)"
echo "'checkip'         (Check your system's public IP address)"
echo "'btcusd'          (Check the current bitcoin/USD exchange rate)"
echo "'nova'            (Calculate floating point arithmetic in the terminal)"
echo "--------------------------------------------------------------------------"
echo ""

exit

################################################################################
#  UPDATES LOG  #
#################
#
# 20180416 ---- Script created (1.0.0)
# 20180416 ---- Conducted first run of the script; encountered errors with the
#               scripts installed to /bin
# 20180416 ---- Added 'dos2unix' (to fix errors); included execution of dos2unix
#               on the scripts installed to /bin to correct the errors (1.0.1)
# 20180417 ---- Changed install of binaries from /bin to /usr/local/bin (1.0.2)
# 20180417 ---- Added install: 'unzip' (1.0.3)
# 20180422 ---- Added 'wscat' to installation list (1.0.4)
# 20180508 ---- Added 'bc' to installation list (1.0.5)
# 20180530 ---- Added 'virtualenv' to installation list; added 'nova' to bash
#               script installations (1.0.6)
# 20180611 ---- Removed unused date variables (1.0.7)
#
################################################################################
                                                   #                           #
                                                   #  "think outside the box"  #
                                                   #                           #
                                                   #    ($) ¯\_(ツ)_/¯ (฿)     #
                                                   #                           #
                                                   #############################

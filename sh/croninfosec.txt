#######################
###   CRONINFOSEC   ###
#######################

# -----------------------------------------------------------------------------------
# Script Source: http://h8rt3rmin8r.com/sh/croninfosec.sh
# ReadMe Source: http://h8rt3rmin8r.com/sh/croninfosec.txt
# Credits: h8rt3rmin8r
# Email: 161803398@email.tg
# PGP Key: http://h8rt3rmin8r.com
# Updated: 20171008-1718
# -----------------------------------------------------------------------------------
# This shell script is designed to check your connection to the PIA VPN service
# This script will also run general checks on network service health
# To use this script, simply copy all contents of this file to ~/.CRON/croninfosec.sh
# Set up a crontab job with the parameters listed below and make the script executable.
# -----------------------------------------------------------------------------------
# DEPENDS
# > network-manager
# > openvpn
# > nmap
# > echo
# > cron
# > crontab
# > date
# -----------------------------------------------------------------------------------
# CRONTAB CONFIGURATIONS
# View current cron configurations with the crontab tool with 'crontab -l'
# NOTE: You are likely to not have any current cron configurations if this is your
# first time creating one.
# Configure cron with the crontab tool with 'crontab -e'
# Add the following two lines into the crontab file and save your changes:

# 0 * * * * ~/.CRON/croninfosec.sh
# @reboot ~/.CRON/croninfosec.sh

# Then navigate to your home directory with 'cd'
# Make the '.CRON' directory with 'mkdir .CRON'
# Move into that new file and use a text editor to create a shell script which
# contains a copy of the entire contents of this README file. Save that new
# script file as "croninfosec.sh".
# MAKE THE SCRIPT EXECUTABLE WITH THE FOLLOWING COMMAND:
# chmod +x ~/.CRON/croninfosec.sh
# -----------------------------------------------------------------------------------
#! /bin/bash
echo `date`' -- CRONINFOSEC: starting security check' >> ~/.CRON/croninfosec.log
echo `date`' -- CRONINFOSEC: checking status of services' >> ~/.CRON/croninfosec.log
echo `service --status-all` >> ~/.CRON/croninfosec.log
echo `date`' -- CRONINFOSEC: running network-manager status check' >> ~/.CRON/croninfosec.log
echo `service network-manager status` >> ~/.CRON/croninfosec.log
echo `date`' -- CRONINFOSEC: network-manager status check complete' >> ~/.CRON/croninfosec.log
echo `date`' -- CRONINFOSEC: running openvpn status check' >> ~/.CRON/croninfosec.log
echo `service openvpn status` >> ~/.CRON/croninfosec.log
echo `date`' -- CRONINFOSEC: openvpn status check complete' >> ~/.CRON/croninfosec.log
echo `date`' -- CRONINFOSEC: running IP address check' >> ~/.CRON/croninfosec.log
echo `curl https://domains.google.com/checkip` >> ~/.CRON/croninfosec.log
echo `date`' -- CRONINFOSEC: IP address check complete' >> ~/.CRON/croninfosec.log
echo `date`' -- CRONINFOSEC: running self-target nmap scan' >> ~/.CRON/croninfosec.log
VAR=`curl https://domains.google.com/checkip`
echo `nmap "${VAR}"` >> ~/.CRON/croninfosec.log
echo `date`' -- CRONINFOSEC: nmap scan complete' >> ~/.CRON/croninfosec.log
echo `date`' -- CRONINFOSEC: security check complete' >> ~/.CRON/croninfosec.log
echo '#------------------------------------------------------------------------' >> ~/.CRON/croninfosec.log
# -----------------------------------------------------------------------------------

###################################
###                             ###
###     ($) ¯\_(ツ)_/¯ (฿)      ###
###                             ###
###   "think outside the box"   ###
###                             ###
###################################

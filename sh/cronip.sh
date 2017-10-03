##################
###   CRONIP   ###
##################

# -----------------------------------------------------------------------------------

# Script Source: http://h8rt3rmin8r.com/sh/cronip.sh
# ReadMe Source: http://h8rt3rmin8r.com/sh/cronip.txt
# Credits: h8rt3rmin8r
# Email: 161803398@email.tg
# PGP Key: http://h8rt3rmin8r.com

# -----------------------------------------------------------------------------------

# DESCRIPTION OF ESSENTIAL FUNCTIONS:
# NOTE: ALL FUNCTIONS ARE PERFORMED ONE TIME EVERY HOUR OF THE DAY

# Fetch system's public IP address, current user, and date/time and append it to: 
# ~/.CRON/cronip.log
# Fetch system's public IP address and date/time and append it to:
# ~/.CRON/datip.log
# Fetch system's public IP address and append it to:
# ~/.CRON/ip.log
# Fetch system's public IP address and overwrite it onto:
# ~/.CRON/lastip.html

# -----------------------------------------------------------------------------------

# DEPENDS

# cron
# crontab
# date
# whoami
# curl

# -----------------------------------------------------------------------------------

# CRONTAB CONFIGURATIONS

# 0 * * * * ~/.CRON/cronip.sh
# @reboot ~/.CRON/cronip.sh

# -----------------------------------------------------------------------------------

# CRONIP.SH SCRIPT:

#! /bin/bash
# Log the initiation of the script into the cronip.log file
echo 'CRONIP: starting fetch' >> ~/.CRON/cronip.log

# Record the current date and time into the cronip.log file
echo 'DATE {'`date`'}' >> ~/.CRON/cronip.log

# Record the name of the current user into the cronip.log file
echo 'USER {'`whoami`'}' >> ~/.CRON/cronip.log

# Fetch the system IP address from the Google Domains server 
# and record it into the cronip.log file
echo 'PUBLIC_IP {'`curl https://domains.google.com/checkip`'}' >> ~/.CRON/cronip.log

# Record the current date and time into the dateip.log file
echo '(' `date` ')' >> ~/.CRON/dateip.log
echo 'CRONIP: date logged into dateip.log' >> ~/.CRON/cronip.log

# Fetch the system IP address from the Google Domains server 
# and record it into the dateip.log file
echo `curl https://domains.google.com/checkip` >> ~/.CRON/dateip.log
echo 'CRONIP: IP logged into dateip.log' >> ~/.CRON/cronip.log

# Fetch the system IP address from the Google Domains server 
# and record it into the ip.log file
echo `curl https://domains.google.com/checkip` >> ~/.CRON/ip.log
echo 'CRONIP: IP logged into ip.log' >> ~/.CRON/cronip.log

# Fetch the system IP address from the Google Domains server
# and overwrite it onto the lastip.html file
echo 'CRONIP last fetch ('`date`') -- '`curl https://domains.google.com/checkip` > lastip.html
echo 'CRONIP: IP updated in lastip.html' >> ~/.CRON/cronip.log

# Record the date and time of successful completion into the cronip.log file
echo 'CRONIP: fetch complete -- '`date` >> ~/.CRON/cronip.log

# -----------------------------------------------------------------------------------

###################################
###                             ###
###     ($) ¯\_(ツ)_/¯ (฿)      ###
###                             ###
###   "think outside the box"   ###
###                             ###
###################################

#! /bin/bash
#######################
#  btc-chain-data.sh  #
##############################################################
#
# Created on 20171229 by h8rt3rmin8r
# Email: 161803398@email.tg
# PGP Key: https://h8rt3rmin8r.com
#
# SCRIPT SETUP:
#
# From inside your bitcoin node directory (~/.bitcoin), run
# the following commands:
#   $ sudo chmod +x btc-chain-data.sh
#   $ mkdir cx && cd cx && mkdir logs archive
# Create a cronjob to run this script every 5 minutes:
#   $ crontab -e
# Input the following into the crontab file:
#   $ 5 * * * * ~/.bitcoin/btc-chain-data.sh
# Finally, make this script executable with the following:
#   $ sudo chmod +x ~/.bitcoin/btc-chain-data.sh
#
#######################
#  VARIABLES          #
##############################################################

# Script scheduling
INTERVAL="5m"
CRON="5 * * * *"

# Network information
N01=`bitcoin-cli getpeerinfo`
N02=`bitcoin-cli getnetworkinfo`
N03=`bitcoin-cli getblockchaininfo`
N04=`bitcoin-cli getmininginfo`

# System information
X01=`bitcoin-cli uptime`

# Date and time information
DT=`date '+%Y%m%d%H%M%S'`

#######################
#  FUNCTIONS          #
##############################################################

echo ${N01} | jq '.' > cx/btc-peerinfo.json && \
        cp cx/btc-peerinfo.json cx/archive/${DT}-btc-peerinfo.json
sleep 1

echo ${N02} | jq '.' > cx/btc-networkinfo.json && \
        cp cx/btc-networkinfo.json cx/archive/${DT}-btc-networkinfo.json
sleep 1

echo ${N03} | jq '.' > cx/btc-chaininfo.json && \
        cp cx/btc-chaininfo.json cx/archive/${DT}-btc-chaininfo.json
sleep 1

echo ${N04} | jq '.' > cx/btc-mininginfo.json && \
        cp cx/btc-mininginfo.json cx/archive/${DT}-btc-mininginfo.json
sleep 1

echo ${DT}' -- Uptime: '${X01} >> cx/logs/btc-uptime.log

##############################################################
                               ###                         ###
                               ### "think outside the box" ###
                               ###   ($) ¯\_(ツ)_/¯ (฿)    ###
                               ###                         ###
                               ###############################

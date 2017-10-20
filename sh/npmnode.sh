#! /bin/bash
######################################################################
# 
# npmnode.sh
#
# node.js and npm installation script for Ubuntu and Debian
# Adapted from https://nodejs.org/en/download/package-manager/ and
# https://docs.npmjs.com/getting-started/fixing-npm-permissions 
#
# By: h8rt3rmin8r
# Email: 161803398@email.tg
# PGP Key: http://h8rt3rmin8r.com
# UPDATED: 20171019
#
######################################################################
# All available architectures:
#
#    i386 (32-bit)
#    amd64 (64-bit)
#    armhf (ARM 32-bit hard-float, ARMv7 and up: arm-linux-gnueabihf)
#
# Supported Ubuntu versions:
#
#    Ubuntu 14.04 LTS (Trusty Tahr)
#    Ubuntu 16.04 LTS (Xenial Xerus)
#
# Supported Debian versions:
#
#    Debian 7 (wheezy)
#    Debian 8 / stable (jessie)
#    Debian testing (stretch, aliased to jessie)
#    Debian unstable (sid)
#
# A Node.js package is also available in the official repo for Debian 
# Sid (unstable), Jessie (testing) and Wheezy (wheezy-backports) as 
# "nodejs". It only installs a nodejs binary.
#
# The nodejs-legacy package installs a node symlink that is needed 
# by many modules to build and run correctly. The Node.js modules 
# available in the distribution official repositories do not need it.
#
# Supported Linux Mint versions:
#
#    Linux Mint 17 "Qiana" (via Ubuntu 14.04 LTS)
#    Linux Mint 17.1 "Rebecca" (via Ubuntu 14.04 LTS)
#    Linux Mint 17.2 "Rafaela" (via Ubuntu 14.04 LTS)
#    Linux Mint Debian Edition (LMDE) 2 "Betsy" (via Debian 8)
#
# Supported elementary OS versions:
#
#    elementary OS Freya (via Ubuntu 14.04 LTS)
#
# Supported Trisquel versions:
#
#    Trisquel 7 "Belenos" (via Ubuntu 14.04 LTS)
#
# Supported BOSS versions:
#
#    BOSS 5.0 "Anokha" (via Debian 7)



curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install additional build tools as well
sudo apt-get install -y build-essential

# Protect against possible credential conflicts
cd ~
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.profile
source ~/.profile
echo 'npmnode installer COMPLETE!'

#! /bin/bash
################################################################################
# MAKE TIME DRIVE #
###################
#
# SOURCES
#
#   make-timedrive.sh       (https://pastebin.com/raw/z6zM81B0)
#   now-a.sh                (https://pastebin.com/raw/SY8CLk7G)
#   now-b.sh                (https://pastebin.com/raw/WseuNSs8)
#   00-23                   (https://pastebin.com/raw/LzvakAQn)
#   00-59                   (https://pastebin.com/raw/iWLfBuM7)
#
# ATTRIBUTION
#
#   Created by:     h8rt3rmin8r
#   Date:           20180417
#   Email:          161803398@email.tg
#   PGP:            https://h8rt3rmin8r.com
#
# DEPENDANCIES 
#
#   curl
#   wget
#   git
#   unzip
#   jq
#   tree
#   html2text
#   dos2unix
#
################################################################################

# Verify sudo/root access
echo "(make-timedrive.sh)  Beginning installation process..."

uid=`id -u $USERNAME`

if [ "$uid" == "0" ]
    then
        echo "(make-timedrive.sh)  User is root"
    else
        echo "(make-timedrive.sh)  You need to have root access, run again with sudo"
    exit 1
fi

# Update the system and verify presence of dependancies
apt-get update
apt-get -y upgrade
apt-get -y dist-upgrade
    # INSTALL: CURL
apt-get install -y curl
    # INSTALL: WGET
apt-get install -y wget
    # INSTALL: GIT
apt-get install -y git
    # INSTALL: UNZIP
apt-get install -y unzip
    # INSTALL: JQ
apt-get install -y jq
    # INSTALL: HTML2TEXT
apt-get install -y html2text
    # INSTALL: DOS2UNIX
apt-get install -y dos2unix
    # INSTALL: TREE
apt-get install -y tree
    # Conclude installations with package update
apt-get update

# Initial directory setup
mkdir -p time/{h,m,s}
cd time

# Download and format time-scale resources -------------------------------------
echo "(make-timedrive.sh)  Fetching time-scale resources from Pastebin..."
sleep 1

# 00-23
curl -Ss 'https://pastebin.com/raw/LzvakAQn' | html2text -ascii > HA.txt
cp HA.txt HB.txt
# 00-59
curl -Ss 'https://pastebin.com/raw/iWLfBuM7' | html2text -ascii > MA.txt
cp MA.txt MB.txt
cp MA.txt SA.txt
cp MA.txt SB.txt

# Set time scale resource contents to variables --------------------------------
HA=`cat HA.txt`
HB=`cat HB.txt`
MA=`cat MA.txt`
MB=`cat MB.txt`
SA=`cat SA.txt`
SB=`cat SB.txt`

# Create the hour series scripts (h)
# h series ---------------------------------------------------------------------
echo "(make-timedrive.sh)  Creating h-series scripts..."
sleep 1

cd h
for i in ${HA}
do
        touch A$i
        echo "#! /bin/bash" > A$i
        echo "# timedrive ID: HA"$i >> A$i
        echo "echo A"$i >> A$i
done
for i in ${HB}
do
        touch B$i
        echo "#! /bin/bash" > B$i
        echo "# timedrive ID: HB"$i >> B$i
        echo "echo B"$i >> B$i
done

# Create the minute series scripts (m)
# m series ---------------------------------------------------------------------
echo "(make-timedrive.sh)  Creating m-series scripts..."
sleep 1

cd .. && cd m
for i in ${MA}
do
        touch A$i
        echo "#! /bin/bash" > A$i
        echo "# timedrive ID: MA"$i >> A$i
        echo "echo A"$i >> A$i
done
for i in ${MB}
do
        touch B$i
        echo "#! /bin/bash" > B$i
        echo "# timedrive ID: MB"$i >> B$i
        echo "echo B"$i >> B$i
done

# Create the second series scripts (s)
# s series ---------------------------------------------------------------------
echo "(make-timedrive.sh)  Creating s-series scripts..."
sleep 1

cd .. && cd s
for i in ${SA}
do
        touch A$i
        echo "#! /bin/bash" > A$i
        echo "# timedrive ID: SA"$i >> A$i
        echo "echo A"$i >> A$i
done
for i in ${SB}
do
        touch B$i
        echo "#! /bin/bash" > B$i
        echo "# timedrive ID: SB"$i >> B$i
        echo "echo B"$i >> B$i
done

# clean up sources -------------------------------------------------------------
cd .. && rm *.txt

# Set sources as executable
sudo chmod +x h/* && sudo chmod +x m/* && sudo chmod +x s/*

# Verify successful creation ---------------------------------------------------
echo ""
echo "(make-timedrive.sh)  Verifying successful setup..."
sleep 2
echo ""
touch verify.txt
echo "" > verify.txt
echo "----------------------------------" >> verify.txt
echo "HOUR SOURCE OUTPUTS:" >> verify.txt
echo "----------------------------------" >> verify.txt
for i in `seq -w 0 23`; do
  bash "h/A$i" >> verify.txt
  bash "h/B$i" >> verify.txt
done
echo "----------------------------------" >> verify.txt
echo "MINUTE SOURCE OUTPUTS:" >> verify.txt
echo "----------------------------------" >> verify.txt
for i in `seq -w 0 59`; do
  bash "m/A$i" >> verify.txt
  bash "m/B$i" >> verify.txt
done
echo "----------------------------------" >> verify.txt
echo "SECOND SOURCE OUTPUTS:" >> verify.txt
echo "----------------------------------" >> verify.txt
for i in `seq -w 0 59`; do
  bash "s/A$i" >> verify.txt
  bash "s/B$i" >> verify.txt
done
echo "" >> verify.txt

# Print verification and destroy verification source ---------------------------
cat verify.txt && rm verify.txt
echo ""
echo "(make-timedrive.sh)  Verification COMPLETE!"
echo "(make-timedrive.sh)  Downloading perpetual activation loops..."
sleep 2

# Download perpetual activation loops ------------------------------------------
cd ..
wget -q https://pastebin.com/raw/SY8CLk7G
touch now-a.sh && cp SY8CLk7G now-a.sh && rm SY8CLk7G
dos2unix -k -o now-a.sh
wget -q https://pastebin.com/raw/WseuNSs8
touch now-b.sh && cp WseuNSs8 now-b.sh && rm WseuNSs8
dos2unix -k -o now-b.sh

# Enable loop execution
sudo chmod +x now-*

echo "(make-timedrive.sh)  Installation COMPLETE!"

# Self-destruct ----------------------------------------------------------------
# rm make-timedrive.sh

################################################################################
#  CHANGES LOG  #
#################

# CBS-20180201-001 -- Script created as "loopSource.sh"
# CBS-20180417-001 -- Repurposed as "make-timedrive.sh"; modified processes for
#                     more complex features such as executable content
# CBS-20180528-001 -- Added -q to all wget commands; added dos2unix workaround
#                     for handling pastebin content without errors; added
#                     function to verify root access during installation

################################################################################
                                                 ###                         ###
                                                 ### "think outside the box" ###
                                                 ###   ($) ¯\_(ツ)_/¯ (฿)    ###
                                                 ###                         ###
                                                 ###############################

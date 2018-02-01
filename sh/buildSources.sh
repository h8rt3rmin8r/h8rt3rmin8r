#! /bin/bash
################################################################################
# BUILD SOURCE DIRECTORIES #
############################
#
# VERSION: CBS-201802011233-001
# ATTRIBUTION: h8rt3rmin8r
# EMAIL: 161803398@email.tg
# PGP: https://h8rt3rmin8r.com
#
# DEPENDANCIES: html2text
#
################################################################################

mkdir -p sources/{hA,hB,mA,mB,sA,sB}
cd sources

curl -Ss 'https://pastebin.com/raw/LzvakAQn' | html2text -ascii > HA.txt
curl -Ss 'https://pastebin.com/raw/LzvakAQn' | html2text -ascii > HB.txt
curl -Ss 'https://pastebin.com/raw/iWLfBuM7' | html2text -ascii > MA.txt
curl -Ss 'https://pastebin.com/raw/iWLfBuM7' | html2text -ascii > MB.txt
curl -Ss 'https://pastebin.com/raw/iWLfBuM7' | html2text -ascii > SA.txt
curl -Ss 'https://pastebin.com/raw/iWLfBuM7' | html2text -ascii > SB.txt

HA=`cat HA.txt`
HB=`cat HB.txt`
MA=`cat MA.txt`
MB=`cat MB.txt`
SA=`cat SA.txt`
SB=`cat SB.txt`

cd hA
for i in ${HA}
do
        touch HA$i
done

cd .. && cd hB
for i in ${HB}
do
        touch HB$i
done

cd .. && cd mA
for i in ${MA}
do
        touch MA$i
done

cd .. && cd mB
for i in ${MB}
do
        touch MB$i
done

cd .. && cd sA
for i in ${SA}
do
        touch SA$i
done

cd .. && cd sB
for i in ${SB}
do
        touch SB$i
done

cd .. && rm *.txt

################################################################################
                                                 ###                         ###
                                                 ### "think outside the box" ###
                                                 ###   ($) ¯\_(ツ)_/¯ (฿)    ###
                                                 ###                         ###
                                                 ###############################

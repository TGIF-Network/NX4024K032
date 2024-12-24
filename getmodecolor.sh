#!/bin/bash
############################################################
#  Get Color Info from /usr/local/etc/Colors.ini           #
#                                                          #
#                                                          #
#  VE3RD                                      2024-04-17   #
############################################################
set -o errexit
set -o pipefail

# Color Numbers
# Teal=1
# Black=2
# Green=3
# Yellow=4
# Blue=5
# Red=6

m1=$(sed -nr "/^\[MMDVM]/ { :1 /^Set[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/Colors.ini)
m2=$(sed -nr "/^\[DMR]/ { :1 /^Set[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/Colors.ini)
m3=$(sed -nr "/^\[YSF]/ { :1 /^Set[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/Colors.ini)
m4=$(sed -nr "/^\[NXDN]/ { :1 /^Set[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/Colors.ini)
m5=$(sed -nr "/^\[P25]/ { :1 /^Set[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/Colors.ini)
m6=$(sed -nr "/^\[D-Star]/ { :1 /^Set[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/Colors.ini)
m7=$(sed -nr "/^\[D-Star]/ { :1 /^Set[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/Colors.ini)
mt="$m1|$m2|$m3|$m4|$m5|$m6|$m7"
 

echo "$mt"



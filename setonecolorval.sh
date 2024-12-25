#!/bin/bash
############################################################
#   Set one mode Colors on Colors.ini                      #
#  						           #
#  						           #
#  VE3RD                                        2024-12-24 #
############################################################
set -o errexit
set -o pipefail
sudo mount -o remount,rw /

Mode="$1"
SN="$2"
Val="$3"

if [ "$1" == "120" ]; then 
 MM="UpperBack"
fi
if [ "$1" == "121" ]; then 
 MM="UpperText"
fi
if [ "$1" == "122" ]; then 
 MM="LowerBack"
fi
if [ "$1" == "120" ]; then 
 MM="LowerText"
fi

#sn=$(sed -nr "/^\['"Mode"']/ { :1 /^Set[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/Colors.ini)

sudo sed -i '/^\[/h;G;/ColorSet'"$SN"'/s/\('"$MM"'=\).*/\1'"$Val"'/m;P;d'  /etc/Colors.ini

sudo mount -o remount,ro /


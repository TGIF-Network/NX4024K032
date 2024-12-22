#!/bin/bash
############################################################
#  Get Color Info from /usr/local/etc/Colors.ini           #
#                                                          #
#  Returns a Binary Coded Value                            #
#                                                          #
#  VE3RD                                      2024-04-17   #
############################################################
set -o errexit
set -o pipefail

if [ "$2" ]; then
	if [ "$2" = "MMDVM" ];  then
		m1=$(sed -n '/^[ \t]*\[MMDVM\]/,/\[/s/^[ \Set[ \t]*=[ \t]*//p' /etc/Colors.ini)
	fi

	if [ "$2" == "DMR" ]; then
		m1=$(sed -n '/^[ \t]*\[DMR\]/,/\[/s/^[ \Set[ \t]*=[ \t]*//p' /etc/Colors.ini)
	fi

	if [ "$2" == "YSF" ]; then
		m1=$(sed -n '/^[ \t]*\[YSF\]/,/\[/s/^[ \Set[ \t]*=[ \t]*//p' /etc/Colors.ini)
	fi

	if [ "$2" == "P25" ]; then
		m1=$(sed -n '/^[ \t]*\[P25\]/,/\[/s/^[ \Set[ \t]*=[ \t]*//p' /etc/Colors.ini)
	fi

	if [ "$2" == "NXDN" ]; then
		m1=$(sed -n '/^[ \t]*\[NXDN\]/,/\[/s/^[ \Set[ \t]*=[ \t]*//p' /etc/Colors.ini)
	fi

	if [ "$2" == "D-Star" ]; then
		m1=$(sed -n '/^[ \t]*\[D-Star\]/,/\[/s/^[ \Set[ \t]*=[ \t]*//p' /etc/Colors.ini)
	fi

	if [ "$2" == "M17" ]; then
		m1=$(sed -n '/^[ \t]*\[M17\]/,/\[/s/^[ \Set[ \t]*=[ \t]*//p' /etc/Colors.ini)
	fi
	SetNum="$m1"
	
    else
	SetNum="$1"

    fi

m1=$(sed -n '/^[ \t]*\[ColorSet'"$SetNum"'\]/,/\[/s/^[ \t]*UpperBack[ \t]*=[ \t]*//p' /etc/Colors.ini)
m2=$(sed -n '/^[ \t]*\[ColorSet'"$SetNum"'\]/,/\[/s/^[ \t]*UpperText[ \t]*=[ \t]*//p' /etc/Colors.ini)
m3=$(sed -n '/^[ \t]*\[ColorSet'"$SetNum"'\]/,/\[/s/^[ \t]*LowerBack[ \t]*=[ \t]*//p' /etc/Colors.ini)
m4=$(sed -n '/^[ \t]*\[ColorSet'"$SetNum"'\]/,/\[/s/^[ \t]*LowerText[ \t]*=[ \t]*//p' /etc/Colors.ini)

#Split
m5=$(sed -n '/^[ \t]*\[ColorSet'"$SetNum"'\]/,/\[/s/^[ \t]*Split[ \t]*=[ \t]*//p' /etc/Colors.ini)

#m5=$(sed -n '/^[ \t]*\[General\]/,/\[/s/^[ \t]*Split[ \t]*=[ \t]*//p' /etc/Colors.ini)
mt="$SetNum|$m5|$m1|$m2|$m3|$m4"
echo "$mt"
#echo "$m1"

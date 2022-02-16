#!/bin/bash
#################################################
#  Get Last Heard Network from DMRGateway	#
#						#
#						#
#  VE3RD 			2020-11-29	#
#################################################
set -o errexit
set -o pipefail

Addr=$(sudo sed -nr "/^\[DMR Network\]/ { :l /^Address[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" /etc/mmdvmhost)
f2=$(sudo ls -x /var/log/pi-star/MMDVM* | tail -n 1)
#echo "$f2"
line=$(sudo cat "$f2" | grep transmission | tail -n 1)
#echo "$line"
nMode=$(echo "$line" | cut -d " " -f 4 | cut -d "," -f 1)
#echo "$nMode"
#echo "$f2"
#echo "$nMode"
 


if [[ ! "$nMode" =~ ^(DMR|P25|YSF|NXDN)$ ]]; then
	echo "NA|NA|NA"
	exit
    
fi
        if [ "$nMode" == "DMR" ]; then
        	if [ $Addr = "127.0.0.1" ]; then
			f1=$(sudo ls -x /var/log/pi-star/DMRGateway* | tail -n1)
                	GW="ON"
                	NetType=$(sudo tail -n1 "$f1" | cut -d " " -f 4)
			NetNum=$(sudo tail -n1 "$f1" | cut -d " " -f 6)
			NName=$(sudo sed -nr "/^\[DMR Network "${NetNum##*( )}"\]/ { :l /^Name[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" /etc/dmrgateway)
			NName=$(echo "$NName" | cut -d "_" -f1 |  tr '[:lower:]' '[:upper:]')
   			echo "DMR|$NName|GW:${NetNum##*( )}"
		else
        
                	GW="OFF"
                	ms=$(sudo sed -n '/^[^#]*'"$Addr"'/p' /usr/local/etc/DMR_Hosts.txt | tail -n 1 | sed -E "s/[[:space:]]+/|/g" | cut -d '|' -f 1 | cut -d "_" -f 1)
                	echo "DMR|$ms|NA"
		fi
#		echo "Mode=DMR"


        elif [ "$nMode" == "P25" ]; then
#		echo "Mode=P25"
		tg=$(sudo sed -nr "/^\[Network\]/ { :l /^Static[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" /etc/p25gateway)
		server=$(grep "$tg" /usr/local/etc/P25HostsLocal.txt |  tr '\t' ' ' | cut -d " " -f2 | cut -d "." -f1 | tr '[:lower:]' '[:upper:]')
if [ -z "$server" ]; then
		server=$(grep "$tg" /usr/local/etc/P25Hosts.txt |  tr '\t' ' ' | cut -d " " -f2 | cut -d "." -f1 | tr '[:lower:]' '[:upper:]')
fi
		echo "P25|$server|NA"
	

        elif [ "$nMode" == "YSF" ]; then
		tg=$(sed -nr "/^\[Network\]/ { :l /^Startup[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" /etc/ysfgateway)
		server=$(grep "$tg" /usr/local/etc/YSFHosts.txt |  tr '\t' ' ' | cut -d ";" -f3 | cut -d "." -f1 | tr '[:lower:]' '[:upper:]')
		echo "YSF|$server|NA"
	

        elif [ "$nMode" == "NXDN" ]; then
echo "Mode=NXDN"
		tg=$(sed -nr "/^\[Network\]/ { :l /^Static[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" /etc/nxdngateway)
echo "tg-$tg"
		server=$(grep "$tg" /usr/local/etc/NXDNHosts.txt |  tr '\t' ' ' | cut -d " " -f2 | cut -d "." -f1 | tr '[:lower:]' '[:upper:]')
		echo "NXDN|$tg|NA"
	fi


#!/bin/bash
#################################################
#  Get Last Heard Network from DMRGateway	#
#						#
#						#
#  VE3RD 			2020-11-29	#
#################################################
set -o errexit
set -o pipefail

Addr=$(sed -nr "/^\[DMR Network\]/ { :l /^Address[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" /etc/mmdvmhost)
f1=$(ls  /var/log/pi-star/DMRGateway* | tail -n1)
f2=$(ls  /var/log/pi-star/MMDVM* | tail -n1)

nMode=$(tail -n1 "$f2" | cut -d " " -f 4 | cut -d "," -f 1)

#echo "$f1"
#echo "$f2"
#echo "$nMode"
        if [ "$nMode" == "DMR" ]; then
        	if [ $Addr = "127.0.0.1" ]; then
                	GW="ON"
                	#fn=$(ls /var/log/pi-star/DMRGateway* | tail -n1 )
                	NetType=$(sudo tail -n1 "$f1" | cut -d " " -f 4)
      #          	NetNum=$(sudo tail -n1 /var/log/pi-star/DMRG* | cut -d " " -f 6)
			NetNum=$(sudo tail -n1 "$f1" | cut -d " " -f 6)
			NName=$(sed -nr "/^\[DMR Network "${NetNum##*( )}"\]/ { :l /^Name[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" /etc/dmrgateway)
			NName=$(echo "$NName" | cut -d "_" -f1 |  tr '[:lower:]' '[:upper:]')

#				echo "${NName##*( )}"
				#if [ "$NetType" = "RFRX" ]; then
#   			echo "$nMode GW:""${NetNum##*( )}"" $NName"
   			echo "DMR|$NName|GW:${NetNum##*( )}"
				#else
			#	echo "$nMode GW:""${NetNum##*( )}"" $NName"
		else
        
                	GW="OFF"
                	ms=$(sudo sed -n '/^[^#]*'"$Addr"'/p' /usr/local/etc/DMR_Hosts.txt | sed -E "s/[[:space:]]+/|/g" | cut -d'|' -f1)
                	echo "DMR|$ms"
		fi
#		echo "Mode=DMR"
	fi

        if [ "$nMode" == "P25" ]; then
#		echo "Mode=P25"
		tg=$(sed -nr "/^\[Network\]/ { :l /^Static[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" /etc/p25gateway)
		server=$(grep 10210 /usr/local/etc/P25HostsLocal.txt |  tr '\t' ' ' | cut -d " " -f2 | cut -d "." -f1 | tr '[:lower:]' '[:upper:]')
		echo "P25|$server"
	fi

        if [ "$nMode" == "YSF" ]; then
		echo "YSF|N/A"
	fi

        if [ "$nMode" == "NXDN" ]; then
		echo "NXDN|N/A"
	fi


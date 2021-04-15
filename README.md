# NX3224K024
If you have already updated to the previous TFT that was posted here before today (4/15/2021) you should be able to just do a normal Git, Copy & Flash procedure to install this latest update. This update increases the size of the Password field in the Profile screen so the new TGIF hotspot security password will fit. 

If you are updating an older 2.4" screen and the normal Git, Copy & Flash procedure does not work then you may need to SSH into the Pi and issue these commands at the command prompt to do the update:

rpi-rw

sudo rm -r -f /home/pi-star/Nextion_Temp

sudo git clone --depth 1 https://github.com/EA7KDO/NX3224K024 /home/pi-star/Nextion_Temp   
(Note: There is a single space after NX3224K024 in the command line.)

sudo rm -r -f /usr/local/etc/Nextion_Support

sudo chmod +x /home/pi-star/Nextion_Temp/cpyfiles.sh

sudo /home/pi-star/Nextion_Temp/cpyfiles.sh        

sudo cp /home/pi-star/Nextion_Temp/NX3224K024.tft /usr/local/etc/NX3224K024.tft   
(Note: There is a single space after NX3224K024.tft in the command line.)

After completing these steps successfully, the user can use the Flash button on the Flash screen to flash the new tft to the screen.
Moving forward the user can reboot and do a standard Git, (wait two minutes) Copy (wait one  minute) & Flash procedure.

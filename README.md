                   
Introduction
-----------------
This script scans for new nodes on the network, and if detected, will send alert via growl
                   
GIT Repo Location
-----------------
https://github.com/pszaro/NewNodeAlert.git
                   
List of Scripts
-----------------

  - [NewNodeAlert.sh]:
   This script scans for new nodes on the network, and if detected, will send alert via growl

  - [check_NewNodeAlert.sh]:
   This script checks if scans for new nodes on the network is executing, and if determined that it's not, will send alert via growl
                   
Things to do
-----------------

Utilities Needed: 

- nmap - Nmap is a free and open source utility for network discovery and security auditing. https://nmap.org/ 

- growlnotify - The Ultimate Notification System for OS X. http://growl.info/ 

- prowl (growl plugin) - Prowl is a push notification client for iOS. https://www.prowlapp.com/ 


- - - - - -

Create a file called 'ApprovedNodes' or copy the template file (ApprovedNodes.template) and on each line, insert all known/valid mac addresses that belong on your network. The script will check this file as reference for known mac addresses.

 example: 

 XX:XX:XX:XX:XX:XX (Device Name)

![alt tag](http://peterszaro.com/images/github-NewNodeAlert-prowl-ss-alert.png)

Once tested manual, set it up to run at your intended interval in cron.



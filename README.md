                   
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
                   
Things to do
-----------------

Utilities Needed: 

- nmap - Nmap is a free and open source utility for network discovery and security auditing. https://nmap.org/ 

- growlnotify - The Ultimate Notification System for OS X. http://growl.info/ 

- prowl (growl plugin) - Prowl is a push notification client for iOS. https://www.prowlapp.com/ 


- - - - - -

Create a file called 'ApprovedNodes' or copy the template file (ApprovedNodes.template) and on each line, insert all known/valid mac addresses that belong on your network. The script will check this file as refernence for known mac addresses.

 example:
 
 <code>
XX:XX:XX:XX:XX:XX (Device Name)

YY:YY:YY:YY:YY:YY (Device Name)

ZZ:ZZ:ZZ:ZZ:ZZ:ZZ (Device Name)
 </code>



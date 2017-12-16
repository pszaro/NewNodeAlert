#!/bin/bash
#
# Description: This script checks if scans for new nodes on the network is executing, and if determined that it's not, will send alert via growl
#
# Utilities Needed: grownotify
#

WORKINGDIR="/Users/${USER}/github-repos/NewNodeAlert"
ARCHIVEDIR="${WORKINGDIR}/Alerts"
datestamp=$(date +"%Y-%m-%d-%HH%MM")

# Checks for file currentNMAPScan and makes sure it's not older than 30 minutes, if so, alert
if [ "$(find ${WORKINGDIR}/currentNMAPScan -mmin +30)" == "${WORKINGDIR}/currentNMAPScan" ]
then
    echo "NewNodeAlert: currentNMAPScan has not been updated in 30 minutes. Check cron entry and make sure script is running every 10 minutes"
    /usr/local/bin/growlnotify -t "NewNodeAlert" -m "currentNMAPScan has not been updated in 30 minutes" -p 1 -i Terminal -s  
fi


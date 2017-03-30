#!/bin/bash
#
# Description: This script scans for new nodes on the network, and if detected, will send alert via growl
#
# Utilities Needed: nmap, grownotify
#

WORKINGDIR="/Users/${USER}/github-repos/NewNodeAlert"
ARCHIVEDIR="${WORKINGDIR}/Alerts"
datestamp=$(date +"%Y-%m-%d-%HH%MM")

[ ! -d "${WORKINGDIR}" ] && mkdir "${WORKINGDIR}"
[ ! -d "${ARCHIVEDIR}" ] && mkdir "${ARCHIVEDIR}"

# clear previous logs
> "${WORKINGDIR}/currentNMAPScan"
> "${WORKINGDIR}/newNodesAlert"
> "${WORKINGDIR}/ignoreNodesAlert"
> "${WORKINGDIR}/currentScan"

# run nmap scan
sudo /usr/local/bin/nmap -sP 192.168.100.1/24 | tee "${WORKINGDIR}/currentNMAPScan"

# reading the file for last check
grep "MAC Address:" "${WORKINGDIR}/currentNMAPScan" | tee -a "${WORKINGDIR}/currentScan"

# compare previous and current nmap scans
#comm -23 "${WORKINGDIR}/previousScan" "${WORKINGDIR}/currentScan" | tee "${WORKINGDIR}/newNodesDiscovered"

# check against Approved Nodes - Alert if not listed
if [ -s "${WORKINGDIR}/currentScan" ];
then
		#for p in $(cat "${WORKINGDIR}/newNodesDiscovered" | awk '{print $3}')
		for p in $(cat "${WORKINGDIR}/currentScan" | awk '{print $3}')
		do
			grep -Fq "${p}" "${WORKINGDIR}/ApprovedNodes"
			if [ "$?" -ne "0" ];
			then
				echo "${p}" | tee -a "${ARCHIVEDIR}/newNodesDiscovered-""${datestamp}"""
				echo "New Nodes Found On Network: ${p}"
				# Notify via Growl, High Priorty
				/usr/local/bin/growlnotify -t "New Node On The Network" -m "${p}" -p 1 -i Terminal -s
			fi
 		done
fi

# makes a copy
grep "MAC Address:" "${WORKINGDIR}/currentScan" | tee "${WORKINGDIR}/previousScan" >/dev/null 2>&1

exit

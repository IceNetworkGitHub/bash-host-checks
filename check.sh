#!/bin/bash

filename='hysing.is'
n=1
while read line; do
	function nmapcheck 
	{
		ping -c 1 $line &> /dev/null && echo Ping successful for $line || echo Ping failed for $line!
		nmap=$(nmap $line -p 80,443,22,53,20,21)
		echo $nmap | awk -v i=$a '{if($19=="up") {print "Connected!" " " "Checking" " " $15 " " "for running services." }}'	
		echo "$nmap" | grep open
	}
	 
nmapcheck
n=$((n+1))
done < $filename

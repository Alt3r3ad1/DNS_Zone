#!/bin/bash
if [[ $1 = "" ]]; then
echo "DNS_Zone by:Alt3r3ad1"
echo "Method for use: ./DNSZone.sh 'target.com'"
else
for server in $(host -t ns $1 | cut -d " " -f 4);
do
if [ $server != "found:" ]; then
echo -e "\n***************$server***************"
host -l -a $1 $server 2> /dev/null | grep -v "REFUSED" | grep -v "failed" | grep -v "error" | grep -v "Trying" | grep -v "timed out"
else
echo -e "\n***************Domain not found***************"
fi
done 2> /dev/null
fi

#!/bin/bash
minecraftLog="/opt/hermitpack/logs/fml-server-latest.log"
session=hermitpack 
 
tail -fn0 $minecraftLog | \
while read line ; do
test=$( echo "$line" | grep "ran the command: /sr*")
 
if [ $? = 0 ]
then
sname=$( echo "$line" | grep "ran the command: /sr*" | awk '{print $5}')
hour=$( echo "$line" | grep "ran the command: /sr*" | awk '{print $10}')
min=$( echo "$line" | grep "ran the command: /sr*" | awk '{print $11}')
sec=$( echo "$line" | grep "ran the command: /sr*" | awk '{print $12}')
 
echo "$sname in $hour $min $sec"
DR=0
 
cat /opt/hermitpack/ops.json | grep "name" | awk '{print $2}' | cut -d \" -f 2 | \
while read name ; do
               
if [ "$tester" = "$name" ]; then
echo "$name is on the list"
               
DR=$((DR+1))
fi
               
done
 
if [ "$tester" = "Server" ]; then
DR=$((DR+1))
fi
 
if [ "$DR" -gt "0" ]; then
               
echo "ran"
echo '/opt/restarter/restarter.sh $session $hour $min $sec'


else
echo "dint run"
 
fi
     
fi 
done

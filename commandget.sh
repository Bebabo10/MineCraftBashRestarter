#!/bin/bash
minecraftLog="/opt/hermitpack/logs/fml-server-latest.log"
path="/opt/restarter"
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

cat /opt/hermitpack/ops.json | grep "name" | awk '{print $2}' | cut -d \" -f 2 | \
while read name ; do
               
if [ "$sname" = "$name" ]; then
echo "$name is on the list"
echo "ran"
sh $path/restarter.sh $session $hour $min $sec
fi             
done
if [ "$sname" = "Server" ]; then
echo "ran"
sh $path/restarter.sh $session $hour $min $sec
fi
 
     
fi 
done

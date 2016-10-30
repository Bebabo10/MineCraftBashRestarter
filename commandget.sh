#!/bin/bash
minecraftLog="/opt/hermitpack/logs/fml-server-latest.log"
 
 
tail -fn0 $minecraftLog | \
while read line ; do
test=$( echo "$line" | grep "ran the command: /sr*")
 
if [ $? = 0 ]
then
tester=$( echo "$line" | grep "ran the command: /sr*" | awk '{print $5}')
tester1=$( echo "$line" | grep "ran the command: /sr*" | awk '{print $10}')
tester2=$( echo "$line" | grep "ran the command: /sr*" | awk '{print $11}')
tester3=$( echo "$line" | grep "ran the command: /sr*" | awk '{print $12}')
 
echo "$tester in $tester1 $tester2 $tester3"
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
               
else
echo "dint run"
 
fi
     
fi 
done

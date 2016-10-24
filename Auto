#!/bin/bash

session=${1:-"0"}
hour=${1:-"0"}
min=${1:-"0"}
sec=${1:-"0"}

Echo "press ^c at anytime to kill the script"

START=$(((3600*hour)+(60*min)+(sec)))

while true
do

for (( c=$START; c>$END ; c-- )) do
sleep 1

done
sh ./restarter.sh $session 

done



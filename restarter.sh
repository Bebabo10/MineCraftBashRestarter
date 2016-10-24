#!/bin/bash

session=${1:-"0"}
hour=${2:-"0"}
min=${3:-"5"}
sec=${4:-"0"}
type=${5:-"broadcast"}
optsay=${6:-""}

START=$(((3600*hour)+(60*min)+(sec)))

if [ "$session" = "0" ]; then
 
echo -n " Enter server to reboot: "
read session
fi 


#echo -n " Enter time in sec till reboot: "
#read START
 
#START=50
END=0
echo "Countdown"
 
for (( c=$START; c>$END ; c-- )) do

tmux send-keys -t $session 'exit' Enter
tmux send-keys -t $session 'exit' Enter
tmux send-keys -t $session 'exit' Enter
tmux send-keys -t $session 'exit' Enter
tmux send-keys -t $session 'exit' Enter
 
if [ "$c" = "300" ]; then
tmux send-keys -t $session ''$type' 5 min till reboot' Enter
tmux send-keys -t $session ''$type' '$optsay'' Enter
tmux send-keys -t $session 'playsound minecraft:block.note.pling master @a 0 0 0 5000 2' Enter
echo  "say 5 min till reboot "
fi

if [ "$c" = "240" ]; then
tmux send-keys -t $session ''$type' 4 min till reboot' Enter
tmux send-keys -t $session ''$type' '$optsay'' Enter

echo  "say 4 min till reboot "
fi

if [ "$c" = "180" ]; then
tmux send-keys -t $session ''$type' 3 min till reboot' Enter
tmux send-keys -t $session ''$type' '$optsay'' Enter
echo  "say 3 min till reboot "
fi

if [ "$c" = "120" ]; then
tmux send-keys -t $session ''$type' 2 min till reboot' Enter
tmux send-keys -t $session ''$type' '$optsay'' Enter
echo  "say 2 min till reboot "
fi

if [ "$c" = "60" ]; then
tmux send-keys -t $session ''$type' 1 min till reboot' Enter
tmux send-keys -t $session ''$type' '$optsay'' Enter
echo "say 1 min till reboot "
fi

if [ "$c" = "30" ]; then
tmux send-keys -t $session ''$type' 30 sec till reboot' Enter
tmux send-keys -t $session ''$type' '$optsay'' Enter
echo  "say 30 sec till reboot "
fi

if [ "$c" -lt "20" ]; then
tmux send-keys -t $session ''$type' '$c' sec till reboot' Enter
tmux send-keys -t $session ''$type' '$optsay'' Enter
tmux send-keys -t $session 'playsound minecraft:block.note.pling music @a 0 0 0 5000' Enter

echo $c

fi
sleep 1
done
tmux send-keys -t $session 'sponge timings paste' Enter 

sleep 1
tmux send-keys -t $session 'kickall Rebooting' Enter
tmux send-keys -t $session 'stop' Enter 
echo "rebooted "


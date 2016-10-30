#!/bin/bash

session=${1:-"0"}
hour=${2:-"0"}
min=${3:-"5"}
sec=${4:-"0"}
type=${5:-"broadcast"}
optsay=${6:-""}

SCOREBOARD=true

START=$(((3600*hour)+(60*min)+(sec)))

if [ "$session" = "0" ]; then
	echo -n " Enter server to reboot: "
	read session
fi 

END=0
echo "Countdown"
 


tmux send-keys -t $session 'exit' Enter
tmux send-keys -t $session 'exit' Enter
tmux send-keys -t $session 'exit' Enter
tmux send-keys -t $session 'exit' Enter
tmux send-keys -t $session 'exit' Enter

if [ "$SCOREBOARD" = "true" ]; then
tmux send-keys -t $session 'scoreboard objectives add Restarting dummy Restarting' Enter
tmux send-keys -t $session 'scoreboard objectives setdisplay sidebar Restarting' Enter
fi

for (( c=$START; c>$END ; c-- )) do

case $c in

    300)
		tmux send-keys -t $session ''$type' 5 min till reboot' Enter
		tmux send-keys -t $session ''$type' '$optsay'' Enter
		tmux send-keys -t $session 'playsound minecraft:block.note.pling master @a 0 0 0 5000 2' Enter
		if [ "$SCOREBOARD" = "true" ]; then
			tmux send-keys -t $session '/scoreboard players set Reboot_in Restarting 5' Enter
		fi
        

    ;;
	
    240)
		tmux send-keys -t $session ''$type' 4 min till reboot' Enter
		tmux send-keys -t $session ''$type' '$optsay'' Enter
		if [ "$SCOREBOARD" = "true" ]; then
			tmux send-keys -t $session '/scoreboard players set Reboot_in Restarting 4' Enter
		fi
        

    ;;
    180)
		tmux send-keys -t $session ''$type' 3 min till reboot' Enter
		tmux send-keys -t $session ''$type' '$optsay'' Enter
		if [ "$SCOREBOARD" = "true" ]; then
			tmux send-keys -t $session '/scoreboard players set Reboot_in Restarting 3' Enter
		fi
        

    ;;
    120)
		tmux send-keys -t $session ''$type' 2 min till reboot' Enter
		tmux send-keys -t $session ''$type' '$optsay'' Enter
		if [ "$SCOREBOARD" = "true" ]; then
			tmux send-keys -t $session '/scoreboard players set Reboot_in Restarting 2' Enter
		fi
        

    ;;
    60)
		tmux send-keys -t $session ''$type' 1 min till reboot' Enter
		tmux send-keys -t $session ''$type' '$optsay'' Enter
		if [ "$SCOREBOARD" = "true" ]; then
			tmux send-keys -t $session '/scoreboard players set Reboot_in Restarting 1' Enter
		fi
        

    ;;
    30)
		tmux send-keys -t $session ''$type' 30 sec till reboot' Enter
		tmux send-keys -t $session ''$type' '$optsay'' Enter
		
		if [ "$SCOREBOARD" = "true" ]; then
			tmux send-keys -t $session '/scoreboard players set Reboot_in Restarting 30' Enter
		fi
        

    ;;
	
    *)
		if [ "$c" -lt "20" ]; then
			tmux send-keys -t $session ''$type' '$c' sec till reboot' Enter
			tmux send-keys -t $session ''$type' '$optsay'' Enter
			tmux send-keys -t $session 'playsound minecraft:block.note.pling music @a 0 0 0 5000' Enter
			
			if [ "$SCOREBOARD" = "true" ]; then
				tmux send-keys -t $session '/scoreboard players set Reboot_in Restarting '$c'' Enter
			fi
			if [ "$c" = "20" ]; then
				tmux send-keys -t $session 'sponge timings paste' Enter 
			
			fi


		fi
        

    ;;
esac	
sleep 1	
done	

sleep 1
tmux send-keys -t $session 'kickall Rebooting' Enter
tmux send-keys -t $session 'scoreboard players reset Reboot_in Restarting' Enter
tmux send-keys -t $session 'stop' Enter
	
	

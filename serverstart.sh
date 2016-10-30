#!/bin/bash
BASE="forge.jar"
RAM=12
hourstillreboot=5
#do not have the same que for multiple servers
#Use letters from c-z
queue=h


session="hermitpack"
args="-XX:PermSize=256m -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=100 -XX:+DisableExplicitGC -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 -XX:InitiatingHeapOccupancyPercent=10 -XX:G1MixedGCLiveThresholdPercent=50 -XX:+AggressiveOpts -XX:+AlwaysPreTouch -Dfml.doNotBackup=true"
while true
do
echo '/opt/restarter/restarter.sh $session' | at -q $queue now + "$hourstillreboot" hours
java $args -server -Xms"$RAM"G -Xmx"$RAM"G -jar $BASE nogui --mods ./sponge.jar
jid="$(atq -q $queue | awk '{print $1}')"
at -q $queue -d $jid

echo "If you want to completely stop the server process now, press Ctrl+C before
the time is up!"
echo "Rebooting in:"

for i in 5 4 3 2 1
do
echo "$i..."
sleep 1
done
echo "Rebooting now!"
done


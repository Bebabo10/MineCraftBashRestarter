while true
do
java -server -Xms12G -Xmx12G -XX:PermSize=256m -XX:TargetSurvivorRatio=80 -XX:MaxTenuringThreshold=15 -XX:+UseParNewGC -XX:+UseConcMarkSweepGC -XX:MaxGCPauseMillis=40 -XX:GCPauseIntervalMillis=150 -XX:+AggressiveOpts -XX:+TieredCompilation -XX:ReservedCodeCacheSize=2048m -XX:+UseCodeCacheFlushing -XX:CompileThreshold=1000 -Dfml.doNotBackup=true -jar forge.jar nogui
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

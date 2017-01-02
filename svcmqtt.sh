export myIP=$(ip route get 1 | awk '{print $NF;exit}')
echo $myIP
cat /etc/mosquitto/mosquitto.conf
node svcmqtt.js
tail -f /dev/null

export myIP=$(ip route get 1 | awk '{print $NF;exit}')
avahi-daemon --daemonize --file=avahi-daemon.conf &
echo $myIP
node svcmqtt.js
tail -f /dev/null

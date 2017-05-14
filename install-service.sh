cp svcmqtt.service /etc/systemd/system/svcmqtt.service
systemctl disable svcmqtt.service
systemctl enable svcmqtt.service
systemctl start svcmqtt.service

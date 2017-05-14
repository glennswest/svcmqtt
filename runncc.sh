docker kill svcmqtt.ncc9.com
docker rm svcmqtt.ncc9.com
docker run -d -p 80 -p 1883 --net=host --name svcmqtt.ncc9.com svcmqtt

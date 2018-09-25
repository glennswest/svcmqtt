docker kill svcmqtt.site.com
docker rm svcmqtt.site.com
docker run -d -p 80 --net=host --name svcmqtt.${SVCDOMAIN} svcmqtt

docker build -t svcmqtt .
docker tag svcrouter s001.site.com:5000/svcmqtt
docker push s001.site.com:5000/svcmqtt

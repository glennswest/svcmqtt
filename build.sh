export PATH=/usr/bin:$PATH
export PYTHON=/usr/bin/python
yum -y install -y avahi-compat-libdns_sd-devel.x86_64
yum -y groupinstall development
docker build -t svcmqtt .
docker tag svcmqtt s001.site.com:5000/svcmqtt
docker push s001.site.com:5000/svcmqtt

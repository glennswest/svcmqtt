export PATH=/usr/bin:$PATH
export PYTHON=/usr/bin/python
yum -y install -y avahi-compat-libdns_sd-devel.x86_64
yum -y groupinstall development
docker build -t svcmqtt .
docker tag svcmqtt ctl.ncc9.com:5000/svcmqtt
docker tag svcmqtt svcmqtt.site.com
docker push ctl.ncc9.com:5000/svcmqtt

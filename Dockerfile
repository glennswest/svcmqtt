#FROM gliderlabs/alpine
FROM mhart/alpine-node:6
MAINTAINER glennswest@neuralcloudcomputing.com

USER root

RUN sed -i -e 's/v3\.4/v3.5/g' /etc/apk/repositories \
        && apk update \
        && apk upgrade \
        && apk add tzdata \
        && cp /usr/share/zoneinfo/Asia/Singapore /etc/localtime \
        && apk del tzdata \
        && rm -rf /var/cache/apk/* \
        && echo "Asia/Singapore" > /etc/timezone 


RUN apk add --update mosquitto mosquitto-clients && \
mkdir /work 

VOLUME ["/work"]


RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY mosquitto.conf /etc/mosquitto/mosquitto.conf
COPY mosquitto-base.conf /etc/mosquitto/mosquitto-base.conf
RUN chmod 777 /etc/mosquitto/mosquitto.conf
RUN chmod 777 /etc/mosquitto/mosquitto-base.conf
RUN ls -l /etc
RUN ls -l /etc/mosquitto
# Bundle app source
COPY . /usr/src/app
RUN npm install


EXPOSE 1883

CMD ["ash","./svcmqtt.sh"]

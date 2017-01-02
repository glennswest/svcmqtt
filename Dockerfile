#FROM gliderlabs/alpine
FROM mhart/alpine-node:6
MAINTAINER glennswest@neuralcloudcomputing.com

RUN sed -i -e 's/v3\.4/v3.5/g' /etc/apk/repositories \
        && apk update \
        && apk upgrade \
        && apk add tzdata \
        && cp /usr/share/zoneinfo/Asia/Singapore /etc/localtime \
        && apk del tzdata \
        && rm -rf /var/cache/apk/* \
        && echo "Asia/Singapore" > /etc/timezone 


RUN apk add --update mosquitto mosquitto-clients && \
mkdir /work && chown nobody /work 

VOLUME ["/work"]
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY mosquitto.conf /etc/mosquitto/mosquitto.conf
COPY mosquitto-base.conf /etc/mosquitto/mosquitto-base.conf
# Bundle app source
COPY . /usr/src/app

USER root

EXPOSE 1883

CMD ["ash","./svcmqtt.sh"]



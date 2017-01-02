#FROM gliderlabs/alpine
FROM mhart/alpine-node:6
MAINTAINER glennswest@neuralcloudcomputing.com

RUN sed -i -e 's/v3\.4/v3.5/g' /etc/apk/repositories \
        && apk update \
        && apk upgrade \
        && apk add openrc \
        && apk add dbus \
        && apk add avahi \
        && apk add avahi-tools \
        && apk add avahi-compat-libdns_sd \
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
# Bundle app source
COPY . /usr/src/app

RUN apk add --virtual .build_dependencies --no-cache make gcc g++ python avahi-dev \
    && npm install \
    && apk del .build_dependencies


USER root

EXPOSE 1883

CMD ["ash","./svcmqtt.sh"]



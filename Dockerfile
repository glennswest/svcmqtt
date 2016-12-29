FROM gliderlabs/alpine
MAINTAINER glennswest@neuralcloudcomputing.com

RUN apk add --update mosquitto mosquitto-clients && \
mkdir /work && chown nobody /work 

VOLUME ["/work"]
WORKDIR /work
COPY mosquitto.conf /etc/mosquitto/mosquitto.conf
COPY mosquitto.conf /etc/mosquitto/mosquitto.conf

USER nobody

EXPOSE 1883

ENTRYPOINT ["mosquitto"]


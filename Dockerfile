
FROM buildpack-deps:trusty-curl

RUN gpg \
    --keyserver hkp://ha.pool.sks-keyservers.net \
    --recv-keys 05CE15085FC09D18E99EFB22684A14CF2582E0C5

ENV INFLUXDB_VERSION=1.2.3 \
    TELEGRAF_VERSION=1.2.1 \
    KAPACITOR_VERSION=1.2.1 \
    CHRONOGRAF_VERSION=1.0.0-rc1

RUN wget -q https://dl.influxdata.com/influxdb/releases/influxdb_${INFLUXDB_VERSION}_amd64.deb.asc && \
    wget -q https://dl.influxdata.com/influxdb/releases/influxdb_${INFLUXDB_VERSION}_amd64.deb && \
    gpg --batch --verify influxdb_${INFLUXDB_VERSION}_amd64.deb.asc influxdb_${INFLUXDB_VERSION}_amd64.deb && \
    dpkg -i influxdb_${INFLUXDB_VERSION}_amd64.deb && \
    rm -f influxdb_${INFLUXDB_VERSION}_amd64.deb* && \
    wget -q https://dl.influxdata.com/telegraf/releases/telegraf_${TELEGRAF_VERSION}_amd64.deb.asc && \
    wget -q https://dl.influxdata.com/telegraf/releases/telegraf_${TELEGRAF_VERSION}_amd64.deb && \
    gpg --batch --verify telegraf_${TELEGRAF_VERSION}_amd64.deb.asc telegraf_${TELEGRAF_VERSION}_amd64.deb && \
    dpkg -i telegraf_${TELEGRAF_VERSION}_amd64.deb && \
    rm -f telegraf_${TELEGRAF_VERSION}_amd64.deb* && \
    wget -q https://dl.influxdata.com/kapacitor/releases/kapacitor_${KAPACITOR_VERSION}_amd64.deb.asc && \
    wget -q https://dl.influxdata.com/kapacitor/releases/kapacitor_${KAPACITOR_VERSION}_amd64.deb && \
    gpg --batch --verify kapacitor_${KAPACITOR_VERSION}_amd64.deb.asc kapacitor_${KAPACITOR_VERSION}_amd64.deb && \
    dpkg -i kapacitor_${KAPACITOR_VERSION}_amd64.deb && \
    rm -f kapacitor_${KAPACITOR_VERSION}_amd64.deb* && \
    wget -q https://dl.influxdata.com/chronograf/releases/chronograf_${CHRONOGRAF_VERSION}_amd64.deb.asc && \
    wget -q https://dl.influxdata.com/chronograf/releases/chronograf_${CHRONOGRAF_VERSION}_amd64.deb && \
    gpg --batch --verify chronograf_${CHRONOGRAF_VERSION}_amd64.deb.asc chronograf_${CHRONOGRAF_VERSION}_amd64.deb && \
    dpkg -i chronograf_${CHRONOGRAF_VERSION}_amd64.deb && \
    rm -f chronograf_${CHRONOGRAF_VERSION}_amd64.deb*

VOLUME  /var/lib/influxdb \
        /var/lib/telegraf \
        /var/lib/kapacitor \
        /var/lib/chronograf

ENV PATH /opt/chronograf:$PATH

EXPOSE 8125/udp 8092/udp 8094 8086 9092 10000

COPY influxdb/* /var/lib/influxdb/
COPY telegraf/* /var/lib/telegraf/
COPY kapacitor/* /var/lib/kapacitor/
COPY chronograf/* /var/lib/chronograf/

ENV INFLUX_CONFIG_PATH=/var/lib/influxdb/influxdb.conf \
    TELEGRAF_CONFIG_PATH=/var/lib/telegraf/telegraf.conf \
    KAPACITOR_CONFIG_PATH=/var/lib/kapacitor/kapacitor.conf \
    CHRONOGRAF_CONFIG_PATH=/var/lib/chronograf/chronograf.conf

COPY entrypoint.sh /entrypoint.sh
COPY runKapacitorAlerts.sh /runKapacitorAlerts.sh
RUN chmod +x entrypoint.sh runKapacitorAlerts.sh

ENTRYPOINT ["/entrypoint.sh"]

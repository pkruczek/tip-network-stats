#!/usr/bin/env bash

influxd -config $INFLUX_CONFIG_PATH &
telegraf -config $TELEGRAF_CONFIG_PATH &
kapacitord -config $KAPACITOR_CONFIG_PATH &
sleep 3 && ./var/lib/kapacitor/runKapacitorAlerts.sh
chronograf -config $CHRONOGRAF_CONFIG_PATH

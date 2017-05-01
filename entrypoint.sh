#!/usr/bin/env bash

influxd &
telegraf &
kapacitord &
sleep 3 && ./runKapacitorAlerts.sh
chronograf
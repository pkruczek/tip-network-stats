#!/usr/bin/env bash

influxd &
telegraf &
chronograf &
kapacitord
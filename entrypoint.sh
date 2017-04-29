#!/usr/bin/env bash

influxd &
telegraf &
kapacitord &
chronograf 
#!/usr/bin/env bash
kapacitor define ping_alert \
    -type stream \
    -tick kapacitor/pingAlert.tick \
    -dbrp telegraf.default
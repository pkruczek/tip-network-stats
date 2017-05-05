#!/usr/bin/env bash
kapacitor define ping_alert \
    -type batch \
    -tick /var/lib/kapacitor/pingAlert.tick \
    -dbrp telegraf.autogen

kapacitor enable ping_alert

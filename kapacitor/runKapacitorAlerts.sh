#!/usr/bin/env bash
kapacitor define ping_alert \
    -type batch \
    -tick kapacitor/pingAlert.tick \
    -dbrp telegraf.autogen

kapacitor enable ping_alert

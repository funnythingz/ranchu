#!/bin/bash

DIR_DAY=`date "+%Y%m%d"`
DIR_H=`date "+%H"`
FILENAME=`date "+%Y%m%d-%H%M"`
mkdir -pv "/home/pi/ranchu/capture/${DIR_DAY}/${DIR_H}"
raspistill -q 5 -o "/home/pi/ranchu/capture/${DIR_DAY}/${DIR_H}/${FILENAME}.jpg"

aws s3 sync /home/pi/ranchu/capture/ s3://ranchu-watch/capture

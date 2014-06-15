#!/bin/bash
raspivid -vs -g 5 -n -hf -vf -pf high -t 0 -h 720 -w 1280 -fps 30 -hf -b 2000000 -o - | gst-launch-1.0 -vv fdsrc ! h264parse ! rtph264pay config-interval=1 pt=96 ! udpsink host=192.168.15.10 port=5000

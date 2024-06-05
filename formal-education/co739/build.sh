#!/bin/sh
#
# build.sh

pandoc --standalone \
       --css ../../assets/serial.css \
       --template ../../assets/serial.html \
       ./notes.md -o ./notes.html

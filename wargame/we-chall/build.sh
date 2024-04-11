#!/bin/sh
#
# build.sh

pandoc --standalone \
       --toc \
       --css ../../assets/serial.css \
       --template ../../assets/serial.html \
       ./index.md -o ./index.html

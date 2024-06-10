#!/bin/sh
#
# build.sh

pandoc --standalone --toc --mathml \
       --css ../../assets/base.css \
       --css ../../assets/serial.css \
       --template ../../assets/serial.html \
       ./index.md -o ./index.html

#!/bin/sh
#
# build.sh

pandoc --standalone \
       --css ./assets/style.css \
       --template ./assets/template.html \
       ./index.md -o ./index.html

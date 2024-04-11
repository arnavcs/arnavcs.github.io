#!/bin/sh
#
# build.sh

pandoc --standalone \
       --css ./assets/episodic.css \
       --template ./assets/episodic.html \
       ./index.md -o ./index.html

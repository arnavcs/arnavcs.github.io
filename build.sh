#!/bin/sh
#
# build.sh

pandoc --standalone \
       --css ./assets/base.css \
       --css ./assets/episodic.css \
       --template ./assets/episodic.html \
       ./index.md -o ./index.html
